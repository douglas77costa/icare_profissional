import 'package:bot_toast/bot_toast.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/data/model/company/company.dart';
import 'package:icare_profissional/data/model/place/place.dart';
import 'package:icare_profissional/data/model/type_company/type_company.dart';
import 'package:icare_profissional/data/repository/company_repository.dart';
import 'package:icare_profissional/data/repository/token_repository.dart';
import 'package:icare_profissional/data/service/company/company_service.dart';
import 'package:icare_profissional/data/service/place/place_service.dart';
import 'package:icare_profissional/data/service/type_company/type_company_service.dart';
import 'package:icare_profissional/util/util.dart';
import 'package:image_picker/image_picker.dart';

enum VALUE_COMPANY { nomeFantasia, descricao, srcImage, phone, typeCompany }

class BusinessController extends GetxController {
  //Models Register
  final company = Company(idTypeCompany: 0).obs;
  final place = Place().obs;

  var newCompany = Company(idTypeCompany: 0);
  var newPlace = Place();

  var typeLabelCompany = "".obs;
  final isLoad = true.obs;
  var labelTypeCompany = "".obs;
  final listTc = List<TypeCompany>().obs;

  var typeCompValue = 0.obs;
  final file = File("").obs;

  var urlImage ="".obs;

  var token = "";

  //API
  final typeCompanyService = TypeCompanyService(Dio());
  final companyService = CompanyService(Dio());
  final placeService = PlaceService(Dio());

  @override
  void onInit() async {
    isLoad.value = true;
    token = "Bearer " + await TokenRepository.getToken();
    company.value = await CompanyRepository.getCompany();
    await getTypeCompany();
    await getPlace();
    isLoad.value = false;
    newPlace = place.value;
    urlImage.value = company.value.srcImage;
    super.onInit();
  }

  Future getTypeCompany() async {
    if (await Util.isConected()) {
      var value = await typeCompanyService.findAll();
      value.forEach((type) {
        if (company.value.idTypeCompany == type.id) {
          labelTypeCompany.value = type.description;
        }
      });
      listTc.addAll(value);
    }
  }

  Future getPlace() async {
    if (await Util.isConected()) {
      try{
        place.value = await placeService.thisPlace(token);
      }catch (obj) {
        isLoad.value = false;
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            BotToast.showText(
                text:
                "Erro ao buscar local: ${res.statusCode} -> ${res.statusMessage}");
            break;
          default:
            break;
        }
      }
    }
  }

  void imgFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera, imageQuality: 50);
    file.value = File(pickedFile.path);
    uploadFile();
  }

  void imgFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    file.value = File(pickedFile.path);
    uploadFile();
  }

  Future uploadFile() async {
    if (!file.value.path.isNullOrBlank) {
      var storageReference =
      FirebaseStorage.instance.ref().child(company.value.nameImage);
      UploadTask uploadTask = storageReference.putFile(file.value);
      await uploadTask;
      urlImage.value = await storageReference.getDownloadURL();
    } else {
      company.value.srcImage = null;
    }
  }

  Future updateCompany(VALUE_COMPANY value) async {
    if (await Util.isConected()) {
      isLoad.value = true;
      var updateCompany = await CompanyRepository.getCompany();
      try {
        switch (value) {
          case VALUE_COMPANY.nomeFantasia:
            updateCompany.nomeFantasia = newCompany.nomeFantasia;
            break;
          case VALUE_COMPANY.descricao:
            updateCompany.descricao = newCompany.descricao;
            break;
          case VALUE_COMPANY.srcImage:
            updateCompany.srcImage = newCompany.srcImage;
            break;
          case VALUE_COMPANY.typeCompany:
            updateCompany.idTypeCompany = typeCompValue.value;
            break;
          case VALUE_COMPANY.phone:
            updateCompany.phone = newCompany.phone;
            break;
        }
        company.value =
        await companyService.updateCompany(updateCompany, token);
        newCompany = company.value;
        await CompanyRepository.saveCompany(company.value);
        await getTypeCompany();
        isLoad.value = false;
      } catch (obj) {
        isLoad.value = false;
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            BotToast.showText(
                text:
                "Erro ao salvar dados: ${res.statusCode} -> ${res.statusMessage}");
            break;
          default:
            break;
        }
      }
    }
  }

  Future updatePlace() async {
    if (await Util.isConected()) {
      isLoad.value = true;
      try {
        newPlace.idCompany = company.value.id;
        place.value = await placeService.updatePlace(token, newPlace);
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

  String validateTipoEmpresa() {
    if (typeCompValue.value.isNullOrBlank || typeCompValue.value == 0) {
      return "Selecione uma categoria";
    } else {
      return null;
    }
  }

  String validateNomeEmpresa() {
    if (newCompany.nomeFantasia == null || newCompany.nomeFantasia.isEmpty) {
      return "O nome não pode ser vazio!";
    } else {
      return null;
    }
  }

  String validatePhoneEmpresa() {
    if (newCompany.phone == null || newCompany.phone.isEmpty) {
      return "O telefone não pode ser vazio!";
    } else {
      return null;
    }
  }

  String validateDescricaoEmpresa() {
    if (newCompany.descricao == null || newCompany.descricao.isEmpty) {
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