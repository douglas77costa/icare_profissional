import 'package:bot_toast/bot_toast.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/data/repository/token_repository.dart';
import 'package:icare_profissional/data/repository/user_repository.dart';
import 'package:icare_profissional/data/service/user/user_service.dart';
import 'package:icare_profissional/util/util.dart';

enum VALUE_USER { nome, cpf, email, phone, password }

class PersonalController extends GetxController {
  //Models Register
  final user = User().obs;
  final showPassword = false.obs;

  var newUser = User();

  final isLoad = true.obs;

  var token = "";

  //API
  final userService = UserService(Dio());

  @override
  void onInit() async {
    isLoad.value = true;
    token = "Bearer " + await TokenRepository.getToken();
    user.value = await UserRepository.getUser();
    isLoad.value = false;
    super.onInit();
  }

  Future<void> updateUser(VALUE_USER value) async {
    if (await Util.isConected()) {
      isLoad.value = true;
      var updateUser = await UserRepository.getUser();
      try {
        switch (value) {
          case VALUE_USER.nome:
            updateUser.firstName = newUser.firstName;
            updateUser.lastName = newUser.lastName;
            break;
          case VALUE_USER.cpf:
            updateUser.cpf = newUser.cpf;
            break;
          case VALUE_USER.email:
            updateUser.email = newUser.email;
            break;
          case VALUE_USER.phone:
            updateUser.phone = newUser.phone;
            break;
          case VALUE_USER.password:
            updateUser.password = newUser.password;
            break;
        }
        user.value = await userService.update(token, user.value);
        newUser = user.value;
        await UserRepository.saveUser(user.value);
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
}
