import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_profissional/ui/colors.dart';
import 'package:get/get.dart';

import 'personal_tab_controller.dart';

class BottomSheetPassword extends StatelessWidget {
  final PersonalController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 0, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 25, left: 10),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(CupertinoIcons.back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        )
                      ],
                    ),
                  ),
                  Obx(() {
                    return Container(
                      margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.showPassword.value,
                        onChanged: (value){
                          controller.user.value.password = value;
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
                  })
                ],
              ),
              Container(
                width: double.infinity,
                padding:
                EdgeInsets.only(top: 45, bottom: 25, left: 30, right: 30),
                child: GFButton(
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop();
                    controller.updateUser(VALUE_USER.password);
                  },
                  color: ColorsApp.acent,
                  text: "SALVAR",
                  shape: GFButtonShape.pills,
                  type: GFButtonType.outline,
                  size: 50,
                  fullWidthButton: true,
                  textStyle:
                  GoogleFonts.asap(color: ColorsApp.acent, fontSize: 20),
                ),
              )
            ],
          ),
        ));
  }
}
