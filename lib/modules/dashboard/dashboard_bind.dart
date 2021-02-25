import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:icare_profissional/modules/home/home_controller.dart';
import 'package:icare_profissional/modules/main/main_controller.dart';
import 'package:icare_profissional/modules/menu/menu_controller.dart';

import 'dashboard_controller.dart';

class MainBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() {
      return DashboardController();
    });
  }
}