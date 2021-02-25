import 'package:bot_toast/bot_toast.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/data/repository/token_repository.dart';
import 'package:icare_profissional/data/repository/user_repository.dart';
import 'package:icare_profissional/data/request/login_request/login_request.dart';
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
    newUser = user.value;
    newUser.password = null;
    isLoad.value = false;
    super.onInit();
  }

  Future<bool> updateUser(VALUE_USER value) async {
    if (await Util.isConected()) {
      isLoad.value = true;
      var updateUser = await UserRepository.getUser();
      try {
        switch (value) {
          case VALUE_USER.nome:
            if(validateNome()==null || validateSobrenome()==null){
              updateUser.firstName = newUser.firstName;
              updateUser.lastName = newUser.lastName;
            }else{
              return false;
            }
            break;
          case VALUE_USER.cpf:
            if(validateCPF()==null){
              updateUser.cpf = newUser.cpf;
            }else{
              return false;
            }
            break;
          case VALUE_USER.email:
            if(validateEmail()==null){
              updateUser.email = newUser.email;
            }else{
              return false;
            }
            break;
          case VALUE_USER.phone:
            if(validatePhone()==null) {
              updateUser.phone = newUser.phone;
            }else{
              return false;
            }
            break;
          case VALUE_USER.password:
            if(validatePassword()==null) {
              updateUser.password = newUser.password;
            }else{
              return false;
            }
            break;
        }
        user.value = await userService.update(token, updateUser);
        newUser = user.value;
        await UserRepository.saveUser(user.value);
        if(value ==VALUE_USER.email || value ==VALUE_USER.password){
          await refreshToken();
        }
        isLoad.value = false;
        return true;
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
        return false;
      }
    }
  }

  Future<void> refreshToken()async{
    try {
      var token = await userService.loginUser(LoginRequest(user.value.email,user.value.password));
      await TokenRepository.saveToken(token);
    } catch (obj) {
      print(obj.toString());
    }
  }

  String validateNome() {
    if (newUser.firstName == null || newUser.firstName.isEmpty) {
      BotToast.showText(text: "Verifique seus dados");
      return "O nome não pode ser vazio!";
    } else {
      return null;
    }
  }

  String validateSobrenome() {
    if (newUser.lastName == null || newUser.lastName.isEmpty) {
      BotToast.showText(text: "Verifique seus dados");
      return "O sobrenome não pode ser vazio!";
    } else {
      return null;
    }
  }

  String validateEmail() {
    if (newUser.email == null || newUser.email.isEmpty) {
      BotToast.showText(text: "Verifique seus dados");
      return "O Email não pode ser vazio!";
    } else if (!EmailValidator.validate(user.value.email)) {
      BotToast.showText(text: "Verifique seus dados");
      return "O Email não é válido";
    } else {
      return null;
    }
  }

  String validateCPF() {
    if (newUser.cpf == null || newUser.cpf.isEmpty) {
      BotToast.showText(text: "Verifique seus dados");
      return "O CPF não pode ser vazio!";
    } else if (!CPF.isValid(user.value.cpf)) {
      return "O CPF não é válido";
    } else {
      return null;
    }
  }

  String validatePhone() {
    if (newUser.phone == null || newUser.phone.isEmpty) {
      BotToast.showText(text: "Verifique seus dados");
      return "O telefone não pode ser vazio!";
    } else {
      return null;
    }
  }

  String validatePassword() {
    if (newUser.password == null || newUser.password.isEmpty) {
      BotToast.showText(text: "Verifique seus dados");
      return "A senha não pode ser vazia!";
    } else if (user.value.password.length < 4) {
      BotToast.showText(text: "Verifique seus dados");
      return "A senha não pode ser menor que 4 carateres!";
    } else {
      return null;
    }
  }
}
