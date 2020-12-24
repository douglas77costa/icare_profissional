import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:icare_profissional/modules/splash/splash_controller.dart';

class SplashBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() {
      return SplashController();
    });

  }
}