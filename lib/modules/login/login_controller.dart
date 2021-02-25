import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/data/repository/token_repository.dart';
import 'package:icare_profissional/data/request/login_request/login_request.dart';
import 'package:icare_profissional/data/service/user/user_service.dart';
import 'package:icare_profissional/util/util.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {

  final showPassword = true.obs;
  final isLoad = false.obs;

  var email = "".obs;
  var password = "".obs;

  final userService = UserService(Dio());

  bool validateLogin() {
    if (validateEmail().isNullOrBlank &&
        validatePassword().isNullOrBlank) {
      return true;
    } else {
      BotToast.showText(text: "Verifique o email e senha");
      return false;
    }
  }

  String validateEmail() {
    if (email.value == null || email.value.isEmpty) {
      return "O Email não pode ser vazio!";
    } else if (!EmailValidator.validate(email.value)) {
      return "O Email não é válido";
    } else {
      return null;
    }
  }

  String validatePassword() {
    if (password.value == null || password.value.isEmpty) {
      return "A senha não pode ser vazia!";
    } else if (password.value.length < 4) {
      return "A senha não pode ser menor que 4 carateres!";
    } else {
      return null;
    }
  }

  Future doLogin()async{
    if (await Util.isConected()) {
      isLoad.value = true;
      try {
        var token = await userService.loginUser(LoginRequest(email.value,password.value));
        await TokenRepository.saveToken(token);
        Get.offAllNamed("/main");
        isLoad.value = false;
      } catch (obj) {
        isLoad.value = false;
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            if(res.statusCode==403){
              BotToast.showText(
                  text:
                  "Email ou senha incorretos!");
            }else{
              BotToast.showText(
                  text:
                  "Erro ao fazer login: ${res.statusCode} -> ${res.statusMessage}");
            }
            break;
          default:
            break;
        }
      }
    }
  }
}
