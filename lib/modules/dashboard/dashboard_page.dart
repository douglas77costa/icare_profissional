import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:icare_profissional/modules/dashboard/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());
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
