import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/ui/colors.dart';
import 'package:icare_profissional/ui/components/card_service_item.dart';
import 'package:line_icons/line_icons.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Meus Serviços"),
        leading: InkWell(
          onTap: () => Get.offNamed("/main"),
          child: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(LineIcons.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
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
