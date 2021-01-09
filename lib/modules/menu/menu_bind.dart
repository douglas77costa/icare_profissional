
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'menu_controller.dart';

class MenuBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuController>(() {
      return MenuController();
    });
  }
}