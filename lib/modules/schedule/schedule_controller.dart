import 'package:get/get.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/data/repository/user_repository.dart';
import 'package:intl/intl.dart';

class ScheduleController extends GetxController{
  //Models Register
  final user = User().obs;

  var welcomeMessage = "".obs;

  @override
  void onInit() async{
    user.value = await UserRepository.getUser();
    getMessage();
    super.onInit();
  }

  Future getMessage()async{
    final now = new DateTime.now();
    int hours = int.tryParse(DateFormat('H').format(now).toString());
    if(hours>=0 && hours<12){
      welcomeMessage.value = "Bom dia, ${user.value.firstName}";
    }
    else if(hours>=12 && hours<18){
      welcomeMessage.value = "Boa Tarde, ${user.value.firstName}";
    }
    else if(hours>=18 && hours<23){
      welcomeMessage.value = "Boa noite, ${user.value.firstName}";
    }
  }
}