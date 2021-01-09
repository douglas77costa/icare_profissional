
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'login_controller.dart';

class LoginBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController();
    });

  }
}