import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/modules/profile/profile_controller.dart';

class ProfileBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() {
      return ProfileController();
    });
  }
}