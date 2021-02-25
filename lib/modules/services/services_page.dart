import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_profissional/ui/colors.dart';
import 'package:icare_profissional/ui/components/card_service_item.dart';
import 'package:line_icons/line_icons.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Meus Serviços"),
      ),
      body: Container(
          margin: EdgeInsets.only(top:0),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CardServiceItem();
              })),
    );
  }
}
