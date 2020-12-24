import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:icare_profissional/data/model/type_company/type_company.dart';
import 'package:icare_profissional/modules/register/register_controller.dart';
import 'package:icare_profissional/ui/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

class Page2 extends StatelessWidget {
  final RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Dados do seu estabelecimento"),
        elevation: 2,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      "Adicione um logo",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: Obx(() {
                          return CircleAvatar(
                            radius: 55,
                            backgroundColor: ColorsApp.acent,
                            child: controller.image.value != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: controller.image.value,
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 100,
                                    height: 100,
                                    child: Icon(
                                      LineIcons.camera,
                                      size: 40,
                                      color: Colors.grey[800],
                                      //color: ColorsApp.acentDark,
                                    ),
                                  ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      onChanged: (value) {
                        controller.company.value.nomeFantasia = value;
                      },
                      validator: (value) {
                        return controller.validateNomeEmpresa();
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText: "Nome do seu negócio",
                          labelText: 'Nome',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        controller.company.value.phone = value;
                      },
                      validator: (value) {
                        return controller.validatePhoneEmpresa();
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          labelText: 'Telefone', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 3,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        controller.company.value.descricao = value;
                      },
                      validator: (value) {
                        return controller.validateDescricaoEmpresa();
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText:
                              "Insira uma pequena descrição do seu negócio",
                          labelText: 'Descrição',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        controller.place.value.zipCode = value;
                      },
                      validator: (value) {
                        return controller.validateCEPEmpresa();
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          labelText: 'CEP', border: OutlineInputBorder()),
                    ),
                  ),
                  Obx(() {
                    return Container(
                      margin: EdgeInsets.only(top: 10, left: 30, right: 30),
                      child: DropdownButton(
                        hint: Text("${controller.validateTipoEmpresa()}"),
                        value: controller.company.value.idTypeCompany,
                        elevation: 16,
                        style: TextStyle(color: Colors.white),
                        isExpanded: true,
                        itemHeight: 80,
                        onChanged: (newValue) {
                          controller.company.update((val) {
                            val.idTypeCompany =newValue;
                          });
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
          }),
        ],
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(LineIcons.image),
                      title: Text('Imagem da Galeria'),
                      onTap: () {
                        controller.imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(LineIcons.camera),
                    title: Text('Abrir câmera'),
                    onTap: () {
                      controller.imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
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
