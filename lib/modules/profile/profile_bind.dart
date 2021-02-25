import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/modules/profile/profile_controller.dart';
import 'package:icare_profissional/modules/profile/tabs/business/business_tab_controller.dart';
import 'package:icare_profissional/modules/profile/tabs/personal/personal_tab_controller.dart';

class ProfileBind extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(BusinessController());
    //Get.put(PersonalController());
  }
}