import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_profissional/modules/register/pages/page_1.dart';
import 'package:icare_profissional/modules/register/pages/page_2.dart';
import 'package:icare_profissional/modules/register/pages/page_3.dart';
import 'package:icare_profissional/modules/register/register_controller.dart';
import 'package:icare_profissional/ui/colors.dart';

class RegisterPage extends StatelessWidget {
  PageController pageController = PageController();
  final RegisterController controller = Get.find();
  var page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: PageView(
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              physics: new NeverScrollableScrollPhysics(),
              controller: pageController,
              children: <Widget>[Page1(), Page2(), Page3()],
              onPageChanged: (num) {
                page = num;
                print("Número da página atual : " + num.toString());
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 35, bottom: 25, left: 30, right: 30),
            child: GFButton(
              onPressed: () async {
                switch (pageController.page.toInt()) {
                  case 0:
                    if(controller.validateUser()){
                      if(await controller.checkUser()){
                        pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }else{
                        BotToast.showText(text: "Email já cadastrado!");
                      }
                    }
                    break;
                  case 1:
                    if (controller.validateCompany()) {
                      if(await controller.searchCep()){
                        pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }
                    }
                    break;
                  case 2:
                    controller.saveCompany();
                    break;
                }
              },
              color: ColorsApp.acent,
              text: "CONTINUAR",
              shape: GFButtonShape.pills,
              type: GFButtonType.outline,
              size: 50,
              fullWidthButton: true,
              textStyle: GoogleFonts.asap(color: ColorsApp.acent, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
