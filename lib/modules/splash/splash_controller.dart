
import 'dart:ui';

import 'package:get/get.dart';
import 'package:icare_profissional/data/repository/user_repository.dart';

class SplashController extends GetxController{

  Future<VoidCallback> redirectPage()async{
    var user = await UserRepository.allUser();
    if(user.toList().isNullOrBlank){
      return (){Get.offAndToNamed("/home");};
    }else{
      return (){Get.offAndToNamed("/main");};
    }
  }
}