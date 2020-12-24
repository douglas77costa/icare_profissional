import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Menu"),
        elevation: 2,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
