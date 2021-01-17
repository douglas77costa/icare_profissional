import 'package:bot_toast/bot_toast.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/data/model/company/company.dart';
import 'package:icare_profissional/data/model/place/place.dart';
import 'package:icare_profissional/data/model/type_company/type_company.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/data/repository/company_repository.dart';
import 'package:icare_profissional/data/repository/token_repository.dart';
import 'package:icare_profissional/data/repository/user_repository.dart';
import 'package:icare_profissional/data/service/company/company_service.dart';
import 'package:icare_profissional/data/service/place/place_service.dart';
import 'package:icare_profissional/data/service/type_company/type_company_service.dart';
import 'package:icare_profissional/util/util.dart';

enum VALUE_COMPANY { nomeFantasia, descricao, srcImage, phone, typeCompany }

class ProfileController extends GetxController {
  //Models Register
  final user = User().obs;
  final company = Company(idTypeCompany: 0).obs;
  final place = Place().obs;

  var newUser = User();
  var newCompany = Company(idTypeCompany: 0);
  var newPlace = Place();

  var typeLabelCompany = "".obs;
  final isLoad = true.obs;
  var labelTypeCompany = "".obs;
  final listTc = List<TypeCompany>().obs;

  var typeCompValue = 0.obs;

  var token = "";

  //API
  final typeCompanyService = TypeCompanyService(Dio());
  final companyService = CompanyService(Dio());
  final placeService = PlaceService(Dio());

  @override
  void onInit() async {
    isLoad.value = true;
    token = "Bearer " + await TokenRepository.getToken();
    user.value = await UserRepository.getUser();
    company.value = await CompanyRepository.getCompany();
    await getTypeCompany();
    await getPlace();
    isLoad.value = false;
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
