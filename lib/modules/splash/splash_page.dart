import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/modules/home/home_page.dart';
import 'package:icare_profissional/ui/colors.dart';
import 'package:icare_profissional/ui/components/splashscreen.dart';


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      title: Text(
        "iCare Profissional",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      navigateAfterSeconds: HomePage(),
      image: Image.asset("images/icon.png"),
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      backgroundColor: ColorsApp.dark,
      loaderColor: ColorsApp.acent,
      loadingText: Text(
        "Carregando...",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
