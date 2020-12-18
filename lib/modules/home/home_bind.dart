import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'home_controller.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController();
    });

  }
}