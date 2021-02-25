import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:icare_profissional/modules/services/services_controller.dart';

class ServicesBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServicesController>(() {
      return ServicesController();
    });
  }
}