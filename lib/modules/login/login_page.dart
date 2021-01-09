import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_profissional/ui/colors.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0),
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
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        controller.email.value = value;
                      },
                      validator: (value) {
                        return controller.validateEmail();
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                    ),
                  ),
                  Obx((){
                    return Container(
                      margin: EdgeInsets.only(
                          top: 30, left: 30, right: 30, bottom: 0),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.showPassword.value,
                        onChanged: (value) {
                          controller.password.value = value;
                        },
                        validator: (value) {
                          return controller.validatePassword();
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                if (controller.showPassword.value) {
                                  controller.showPassword.value = false;
                                } else {
                                  controller.showPassword.value = true;
                                }
                              },
                              icon: Icon(Icons.visibility),
                            )),
                      ),
                    );
                  }),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: 50, bottom: 25, left: 30, right: 30),
                    child: GFButton(
                      onPressed: () async {
                        if(controller.validateLogin()){
                          await controller.doLogin();
                        }
                      },
                      color: Colors.white,
                      text: "CONTINUAR",
                      shape: GFButtonShape.pills,
                      type: GFButtonType.outline,
                      size: 50,
                      fullWidthButton: true,
                      textStyle:
                          GoogleFonts.asap(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              return Visibility(
                  visible: controller.isLoad.value,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: ColorsApp.darkBackground,
                    child: Center(
                      child: SpinKitThreeBounce(
                        color: ColorsApp.acent,
                      ),
                    ),
                  ));
            })
          ],
        ),
      ),
    );
  }
}
