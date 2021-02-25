import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:icare_profissional/data/model/company/company.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/data/repository/company_repository.dart';
import 'package:icare_profissional/data/repository/token_repository.dart';
import 'package:icare_profissional/data/repository/user_repository.dart';

class MenuController extends GetxController {
  //Models Register
  final user = User().obs;
  final company = Company(idTypeCompany: 0).obs;

  var token = "";

  @override
  void onInit() async {
    token = "Bearer "+ await TokenRepository.getToken();
    user.value = await UserRepository.getUser();
    company.value = await CompanyRepository.getCompany();
    super.onInit();
  }

  Future logOut() async {
    await Hive.deleteFromDisk();
    Get.offAllNamed("/home");
  }

}
