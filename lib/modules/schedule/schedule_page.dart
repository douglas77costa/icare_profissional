
import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/modules/schedule/schedule_controller.dart';

class SchedulePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Quinta, 20 de janeiro de 2020"),
        elevation: 2,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
