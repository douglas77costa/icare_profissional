import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Notificações"),
        elevation: 2,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
