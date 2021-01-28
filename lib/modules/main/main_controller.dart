import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/data/model/company/company.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/data/repository/company_repository.dart';
import 'package:icare_profissional/data/repository/token_repository.dart';
import 'package:icare_profissional/data/repository/user_repository.dart';
import 'package:icare_profissional/data/service/company/company_service.dart';
import 'package:icare_profissional/data/service/user/user_service.dart';
import 'package:icare_profissional/modules/menu/menu_controller.dart';
import 'package:icare_profissional/modules/schedule/schedule_controller.dart';
import 'package:icare_profissional/util/util.dart';

class MainController extends GetxController{

  //Models Register
  final user = User().obs;
  final company = Company(idTypeCompany: 0).obs;

  final isLoad = false.obs;

  final userService = UserService(Dio());
  final companyService = CompanyService(Dio());
  var token = "";

  @override
  void onInit() async {
    token = "Bearer "+ await TokenRepository.getToken();
    await getUser();
    await getCompany();
    final MenuController controllerMenu = Get.find();
    controllerMenu.onInit();
    final ScheduleController scheduleController = Get.find();
    scheduleController.onInit();
    super.onInit();
  }


  Future getUser() async {
    if (await Util.isConected()) {
      isLoad.value = true;
      try {
        user.value = await userService.profile(token);
        await UserRepository.saveUser(user.value);
        isLoad.value = false;
      } catch (obj) {
        isLoad.value = false;
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            BotToast.showText(
                text:
                "Erro ao buscar perfil: ${res.statusCode} -> ${res.statusMessage}");
            break;
          default:
            break;
        }
      }
    } else {
      user.value = await UserRepository.getUser();
    }
  }

  Future getCompany() async {
    if (await Util.isConected()) {
      isLoad.value = true;
      try {
        company.value = await companyService.thisCompany(token);
        await CompanyRepository.saveCompany(company.value);
        isLoad.value = false;
      } catch (obj) {
        isLoad.value = false;
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            BotToast.showText(
                text:
                "Erro ao buscar dados comerciais: ${res.statusCode} -> ${res.statusMessage}");
            break;
          default:
            break;
        }
      }
    } else {
      company.value = await CompanyRepository.getCompany();
    }
  }
}