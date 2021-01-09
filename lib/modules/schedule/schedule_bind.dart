import 'package:get/get.dart';
import 'package:icare_profissional/modules/schedule/schedule_controller.dart';

class RegisterBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleController>(() {
      return ScheduleController();
    });
  }
}