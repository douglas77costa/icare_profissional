import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/modules/schedule/schedule_controller.dart';

class SchedulePage extends StatelessWidget {
  final ScheduleController controller = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Obx(() {
          return Text("${controller.welcomeMessage.value}");
        }),
        elevation: 2,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
