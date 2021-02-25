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
import 'package:icare_profissional/data/repository/company_repository.dart';
import 'package:icare_profissional/data/repository/token_repository.dart';
import 'package:icare_profissional/data/repository/user_repository.dart';
import 'package:icare_profissional/data/request/login_request/login_request.dart';
import 'package:icare_profissional/data/service/company/company_service.dart';
import 'package:icare_profissional/data/service/place/place_service.dart';
import 'package:icare_profissional/data/service/type_company/type_company_service.dart';
import 'package:icare_profissional/data/service/user/user_service.dart';
import 'package:icare_profissional/util/util.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  //Variables
  final showPassword = false.obs;
  final RxString textErrorPass = "".obs;
  final image = Image.asset(
    "images/icon_new.png",
    width: 100,
    height: 100,
    fit: BoxFit.fitHeight,
  ).obs;
  final file = File("").obs;
  final listTc = List<TypeCompany>().obs;
  final isLoad = true.obs;
  final isError = false.obs;
  final statusText = "".obs;
  final progressBarValue = 0.33.obs;

  //Models Register
  final user = User().obs;
  final company = Company(idTypeCompany: 0).obs;
  final place = Place().obs;

  //API
  final typeCompanyService = TypeCompanyService(Dio());
  final placeService = PlaceService(Dio());
  final companyService = CompanyService(Dio());
  final userService = UserService(Dio());

  //DataBase

  void onInit() async {
    super.onInit();
    statusText.value = "Insira seus dados pessoais";
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

  void imgFromCamera() async {
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

  void imgFromGallery() async {
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
    if (!file.value.path.isNullOrBlank) {
      var nameImage = 'logo/${DateTime.now()}';
      var storageReference =
          FirebaseStorage.instance.ref().child(nameImage);
      UploadTask uploadTask = storageReference.putFile(file.value);
      await uploadTask;
      company.value.srcImage = await storageReference.getDownloadURL();
      company.value.nameImage = nameImage;
    } else {
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

  bool validateImage(){
    if (!file.value.path.isNullOrBlank) {
      return true;
    }else{
      BotToast.showText(text: "Adicione uma imagem antes de continuar");
      return false;
    }
  }

  bool validateCompany() {
    if (validateNomeEmpresa().isNullOrBlank &&
        validatePhoneEmpresa().isNullOrBlank &&
        validateDescricaoEmpresa().isNullOrBlank &&
        validateTipoEmpresa().isNullOrBlank &&
        validateCEPEmpresa().isNullOrBlank) {
      return true;
    } else {
      BotToast.showText(text: "Verifique seus dados");
      return false;
    }
  }

  Future<bool> checkUser() async {
    if (await Util.isConected()) {
      isLoad.value = true;
      return await userService.checkUser(user.value.email).whenComplete(() {
        isLoad.value = false;
      });
    } else {
      return false;
    }
  }

  Future<bool> searchCep() async {
    if (await Util.isConected()) {
      isLoad.value = true;
      try {
        place.value = await placeService.searchCep(place.value.zipCode);
        await uploadFile();
        isLoad.value = false;
        return true;
      } catch (obj) {
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
    } else {
      return false;
    }
  }

  Future saveCompany() async {
    if (await Util.isConected()) {
      isLoad.value = true;
      try {
        company.value = await companyService.createCompany(company.value);
        await CompanyRepository.saveCompany(company.value);
        savePlace();
        isLoad.value = false;
      } catch (obj) {
        isLoad.value = false;
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            BotToast.showText(
                text:
                    "Erro ao salvar empresa: ${res.statusCode} -> ${res.statusMessage}");
            break;
          default:
            break;
        }
      }
    }
  }

  Future savePlace() async {
    if (await Util.isConected()) {
      isLoad.value = true;
      try {
        place.value.idCompany = company.value.id;
        place.value = await placeService.createPlace(place.value);
        saveUser();
        isLoad.value = false;
      } catch (obj) {
        isLoad.value = false;
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            BotToast.showText(
                text:
                    "Erro ao salvar local: ${res.statusCode} -> ${res.statusMessage}");
            break;
          default:
            break;
        }
      }
    }
  }

  Future saveUser() async {
    if (await Util.isConected()) {
      isLoad.value = true;
      try {
        String pass = user.value.password;
        user.value.idCompany = company.value.id;
        user.value.idTypeUser = 1;
        user.value = await userService.signupUser(user.value);
        user.value.password = pass;
        await UserRepository.saveUser(user.value);
        await doLogin();
        isLoad.value = false;
      } catch (obj) {
        isLoad.value = false;
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            BotToast.showText(
                text:
                    "Erro ao salvar usuário: ${res.statusCode} -> ${res.statusMessage}");
            break;
          default:
            break;
        }
      }
    }
  }

  Future doLogin()async{
    if (await Util.isConected()) {
      isLoad.value = true;
      try {
        var token = await userService.loginUser(LoginRequest(user.value.email,user.value.password));
        await TokenRepository.saveToken(token);
        Get.offAllNamed("/main");
        isLoad.value = false;
      } catch (obj) {
        isLoad.value = false;
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            BotToast.showText(
                text:
                "Erro ao fazer login: ${res.statusCode} -> ${res.statusMessage}");
            break;
          default:
            break;
        }
      }
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

  String validateTipoEmpresa() {
    if (company.value.idTypeCompany.isNullOrBlank ||
        company.value.idTypeCompany == 0) {
      return "Selecione uma categoria";
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
