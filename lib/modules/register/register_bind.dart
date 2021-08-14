import 'package:get/get.dart';

import 'register_controller.dart';

class RegisterBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() {
      return RegisterController();
    });
  }
}