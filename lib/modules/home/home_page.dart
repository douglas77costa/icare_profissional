import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_profissional/ui/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("images/bg_img.png", fit: BoxFit.cover),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black87,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 150),
                child: Image.asset(
                  "images/icon.png",
                  fit: BoxFit.cover,
                  width: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("iCare Profissional",
                    style: GoogleFonts.asap(
                        fontSize: 32, fontWeight: FontWeight.w700)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text("É BOM TE VER AQUI",
                    style: GoogleFonts.montserrat(
                        fontSize: 24, fontWeight: FontWeight.w700)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 45, right: 45),
                child: Text(
                  "Cadastre seu salão ou barbearia e ofereça serviços digitais exclusivos aos seus clientes!",
                  style: GoogleFonts.montserrat(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 370,
                padding: EdgeInsets.only(top: 50),
                child: GFButton(
                  onPressed: () {
                    Get.toNamed("/register");
                  },
                  color: ColorsApp.acent,
                  text: "QUERO ME CADASTRAR",
                  shape: GFButtonShape.pills,
                  type: GFButtonType.outline,
                  size: 60,
                  fullWidthButton: true,
                  textStyle:
                      GoogleFonts.asap(color: ColorsApp.acent, fontSize: 20),
                ),
              ),
              Container(
                width: 370,
                padding: EdgeInsets.only(top: 20),
                child: GFButton(
                  onPressed: () {
                    Get.toNamed("/login");
                  },
                  color: Colors.white,
                  text: "QUERO ME LOGAR",
                  shape: GFButtonShape.pills,
                  type: GFButtonType.outline,
                  size: 60,
                  fullWidthButton: true,
                  textStyle:
                      GoogleFonts.asap(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
