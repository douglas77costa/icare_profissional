import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/data/model/company/company.dart';
import 'package:icare_profissional/data/model/place/place.dart';
import 'package:icare_profissional/data/model/type_company/type_company.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/data/service/place/place_service.dart';
import 'package:icare_profissional/data/service/type_company/type_company_service.dart';
import 'package:icare_profissional/util/util.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final showPassword = false.obs;
  final RxString textErrorPass = "".obs;
  final image = Image.asset(
    "images/icon.png",
    width: 100,
    height: 100,
    fit: BoxFit.fitHeight,
  ).obs;
  final file = File("").obs;
  final listTc = List<TypeCompany>().obs;
  final isLoad = true.obs;
  final isError = false.obs;

  //Models Register
  final user = User().obs;
  final company = Company(idTypeCompany: 0).obs;
  final place = Place().obs;

  final typeCompanyService = TypeCompanyService(Dio());
  final placeService = PlaceService(Dio());

  void onInit() {
    super.onInit();
    getTypeCompany();
  }

  void getTypeCompany() {
    Util.isConected().then((value) {
      if (value) {
        typeCompanyService.findAll().then((value) {
          value.forEach((element) {
            print(element.description);
          });
          isLoad.value = false;
          listTc.addAll(value);
        });
      }
    });
  }

  imgFromCamera() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 50);
    image.value = Image.file(
      File(pickedFile.path),
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
    file.value = File(pickedFile.path);
  }

  imgFromGallery() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    image.value = Image.file(
      File(pickedFile.path),
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
    file.value = File(pickedFile.path);
  }

  Future uploadFile() async {
    if(!file.value.path.isNullOrBlank){
      var storageReference =
      FirebaseStorage.instance.ref().child('logo/${DateTime.now()}');
      UploadTask uploadTask = storageReference.putFile(file.value);
      await uploadTask;
      storageReference.getDownloadURL().then((fileURL) {
        company.value.srcImage = fileURL;
      });
    }else{
      company.value.srcImage = null;
    }

  }

  bool validateUser() {
    if (validateNome().isNullOrBlank &&
        validateSobrenome().isNullOrBlank &&
        validateEmail().isNullOrBlank &&
        validateCPF().isNullOrBlank &&
        validatePhone().isNullOrBlank &&
        validatePassword().isNullOrBlank) {
      return true;
    } else {
      BotToast.showText(text: "Verifique seus dados");
      return false;
    }
  }

  bool validateCompany(){
    if (validateNomeEmpresa().isNullOrBlank &&
        validatePhoneEmpresa().isNullOrBlank &&
        validateDescricaoEmpresa().isNullOrBlank &&
        validateCEPEmpresa().isNullOrBlank) {
      return true;
    } else {
      BotToast.showText(text: "Verifique seus dados");
      return false;
    }
  }

  Future<bool> searchCep()async{
    if (await Util.isConected()) {
      isLoad.value = true;
      try{
        place.value = await placeService.searchCep(place.value.zipCode);
        await uploadFile();
        isLoad.value = false;
        return true;
      }catch(obj){
        isLoad.value = false;
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            if (res.statusCode == 404) {
              BotToast.showText(text: "CEP não encontrado!");
            } else {
              BotToast.showText(
                  text:
                  "Erro ao buscar dados: ${res.statusCode} -> ${res.statusMessage}");
            }
            return false;
            break;
          default:
            return false;
            break;
        }
      }

      /*var placeNew = await placeService.searchCep(place.value.zipCode).then((value) async{
        isLoad.value = false;
        await uploadFile();
        return true;
      }).catchError((Object obj) {
        isLoad.value = false;
        return false;
        *//*switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            if (res.statusCode == 404) {
              BotToast.showText(text: "CEP não encontrado!");
            } else {
              BotToast.showText(
                  text:
                  "Erro ao buscar dados: ${res.statusCode} -> ${res.statusMessage}");
            }
            return false;
            break;
          default:
            return false;
            break;
        }*//*
      });*/

    } else {
      return false;
    }
  }

  String validateNome() {
    if (user.value.firstName == null || user.value.firstName.isEmpty) {
      return "O nome não pode ser vazio!";
    } else {
      return null;
    }
  }

  String validateSobrenome() {
    if (user.value.lastName == null || user.value.lastName.isEmpty) {
      return "O sobrenome não pode ser vazio!";
    } else {
      return null;
    }
  }

  String validateEmail() {
    if (user.value.email == null || user.value.email.isEmpty) {
      return "O Email não pode ser vazio!";
    } else if (!EmailValidator.validate(user.value.email)) {
      return "O Email não é válido";
    } else {
      return null;
    }
  }

  String validateCPF() {
    if (user.value.cpf == null || user.value.cpf.isEmpty) {
      return "O CPF não pode ser vazio!";
    } else if (!CPF.isValid(user.value.cpf)) {
      return "O CPF não é válido";
    } else {
      return null;
    }
  }

  String validatePhone() {
    if (user.value.phone == null || user.value.phone.isEmpty) {
      return "O telefone não pode ser vazio!";
    } else {
      return null;
    }
  }

  String validatePassword() {
    if (user.value.password == null || user.value.password.isEmpty) {
      return "A senha não pode ser vazia!";
    } else if (user.value.password.length < 4) {
      return "A senha não pode ser menor que 4 carateres!";
    } else {
      return null;
    }
  }

  String validateNomeEmpresa() {
    if (company.value.nomeFantasia == null ||
        company.value.nomeFantasia.isEmpty) {
      return "O nome não pode ser vazio!";
    } else {
      return null;
    }
  }

  String validatePhoneEmpresa() {
    if (company.value.phone == null || company.value.phone.isEmpty) {
      return "O telefone não pode ser vazio!";
    } else {
      return null;
    }
  }

  String validateDescricaoEmpresa() {
    if (company.value.descricao == null || company.value.descricao.isEmpty) {
      return "A descrição não pode ser vazia!";
    } else {
      return null;
    }
  }

  String validateCEPEmpresa() {
    if (place.value.zipCode == null || place.value.zipCode.isEmpty) {
      return "O CEP não pode ser vazio!";
    } else {
      return null;
    }
  }
}
