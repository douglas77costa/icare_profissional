import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_profissional/modules/profile/tabs/personal/personal_tab_controller.dart';
import 'package:icare_profissional/ui/colors.dart';
import 'package:get/get.dart';

class BottomSheetName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PersonalController controller = Get.find();
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
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: TextFormField(
                      onChanged: (value) {
                        controller.newUser.firstName = value;
                      },
                      validator: (value) {
                        return controller.validateNome();
                      },
                      initialValue: controller.user.value.firstName,
                      autovalidateMode: AutovalidateMode.always,
                      decoration: InputDecoration(
                          labelText: 'Nome', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      onChanged: (value) {
                        controller.newUser.lastName = value;
                      },
                      validator: (value) {
                        return controller.validateSobrenome();
                      },
                      initialValue: controller.user.value.lastName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          labelText: 'Sobrenome', border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.only(top: 45, bottom: 25, left: 30, right: 30),
                child: GFButton(
                  onPressed: () async {
                    await controller.updateUser(VALUE_USER.nome).then((value) => {
                      if(value){
                        Navigator.of(context, rootNavigator: true).pop()
                      }
                    });
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
