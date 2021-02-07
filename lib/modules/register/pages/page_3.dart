
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:icare_profissional/ui/colors.dart';

import '../register_controller.dart';

class Page3 extends StatelessWidget {
  final RegisterController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.street,
                      decoration: InputDecoration(
                          labelText: 'Endereço', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      onChanged: (value){controller.place.value.number = value;},
                      decoration: InputDecoration(
                          labelText: 'Número', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.neighbourhood,
                      decoration: InputDecoration(
                          labelText: 'Bairro', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.complement,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value){controller.place.value.complement = value;},
                      decoration: InputDecoration(
                          labelText: 'Complemento', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.city,
                      decoration: InputDecoration(
                          labelText: 'Cidade', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.state,
                      decoration: InputDecoration(
                          labelText: 'Estado', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      initialValue: controller.place.value.zipCode,
                      decoration: InputDecoration(
                          labelText: 'CEP', border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
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
    );
  }
}