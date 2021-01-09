import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/floating_widget/gf_floating_widget.dart';
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
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top:80),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CardServiceItem();
                  })),
          Card(
            margin: EdgeInsets.all(0),
            elevation: 3,
            child: Container(
              color: ColorsApp.primary,
              padding: EdgeInsets.only(left: 30, right: 30, top: 30),
              width: double.infinity,
              height: 110,
              child: Center(
                child: GFButton(
                  onPressed: () {},
                  color: Colors.white,
                  text: "ADICIONAR SERVIÇO",
                  icon: Icon(LineIcons.plus),
                  shape: GFButtonShape.pills,
                  type: GFButtonType.outline,
                  position: GFPosition.start,
                  size: 50,
                  fullWidthButton: true,
                  textStyle:
                  GoogleFonts.asap(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
