import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Agenda"),
        elevation: 2,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
