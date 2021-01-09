import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_profissional/data/model/type_company/type_company.dart';
import 'package:icare_profissional/ui/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:get/get.dart';

import '../../profile_controller.dart';

class BottomSheetTypeCompany extends StatelessWidget {
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.typeCompValue.value = controller.company.value.idTypeCompany;
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
                    child: Obx(() {
                      return Container(
                        margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                        child: DropdownButton(
                          hint: Text("${controller.validateTipoEmpresa()}"),
                          value: controller.typeCompValue.value,
                          elevation: 16,
                          style: TextStyle(color: Colors.white),
                          isExpanded: true,
                          itemHeight: 80,
                          onChanged: (newValue) {
                            controller.typeCompValue.value = newValue;
                            controller.validateTipoEmpresa();
                          },
                          underline: Container(
                            height: 2,
                            color: Colors.white30,
                          ),
                          items: listType(),
                        ),
                      );
                    }),
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
                    controller.updateCompany(VALUE_COMPANY.typeCompany);
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

  List<DropdownMenuItem> listType() {
    return controller.listTc.value.map<DropdownMenuItem>((TypeCompany value) {
      return DropdownMenuItem(
        value: value.id,
        child: Text(value.description),
      );
    }).toList();
  }
}
