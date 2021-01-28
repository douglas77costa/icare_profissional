import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_profissional/ui/colors.dart';
import 'package:get/get.dart';

import 'business_tab_controller.dart';

class BottomSheetPlace extends StatelessWidget {
  final BusinessController controller = Get.find();
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
                  Container(
                    margin: EdgeInsets.only(top: 0, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.street,
                      onChanged: (value){controller.newPlace.street = value;},
                      decoration: InputDecoration(
                          labelText: 'Endereço', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.number,
                      onChanged: (value){controller.newPlace.number = value;},
                      decoration: InputDecoration(
                          labelText: 'Número', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.neighbourhood,
                      onChanged: (value){controller.newPlace.neighbourhood = value;},
                      decoration: InputDecoration(
                          labelText: 'Bairro', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.complement,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value){controller.newPlace.complement = value;},
                      decoration: InputDecoration(
                          labelText: 'Complemento', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.city,
                      onChanged: (value){controller.newPlace.city = value;},
                      decoration: InputDecoration(
                          labelText: 'Cidade', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.state,
                      onChanged: (value){controller.newPlace.state = value;},
                      decoration: InputDecoration(
                          labelText: 'Estado', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.zipCode,
                      onChanged: (value){controller.newPlace.zipCode = value;},
                      decoration: InputDecoration(
                          labelText: 'CEP', border: OutlineInputBorder()),
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
                    Navigator.of(context, rootNavigator: true).pop();
                    controller.updatePlace();
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
