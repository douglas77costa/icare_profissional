import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:icare_profissional/modules/home/home_controller.dart';
import 'package:icare_profissional/modules/main/main_controller.dart';

class MainBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() {
      return MainController();
    });

  }
}