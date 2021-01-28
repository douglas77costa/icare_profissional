import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:icare_profissional/modules/profile/tabs/business/bottom_sheet_descricao.dart';
import 'package:icare_profissional/modules/profile/tabs/business/bottom_sheet_phone.dart';
import 'package:icare_profissional/modules/profile/tabs/business/bottom_sheet_place.dart';
import 'package:icare_profissional/ui/colors.dart';
import 'package:line_icons/line_icons.dart';

import '../../profile_controller.dart';
import 'bottom_sheet_name.dart';
import 'bottom_sheet_type_company.dart';
import 'business_tab_controller.dart';

class BusinessTab extends StatelessWidget {
  final BusinessController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: GFButton(
                    elevation: 0,
                    onPressed: () {
                      _showPicker(context);
                    },
                    color: ColorsApp.primary,
                    shape: GFButtonShape.pills,
                    icon: Icon(LineIcons.edit),
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "Trocar imagem",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: double.infinity,
                  child: Obx(() {
                    return Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: ColorsApp.acent,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: ColorsApp.acent,
                          backgroundImage: NetworkImage(
                              "${controller.urlImage.value}"),
                        ),
                      ),
                    );
                  }),
                ),
                Divider(),
                Container(
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        _editName(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ListTile(
                          title: Obx(() {
                            return Text(
                              "${controller.company.value.nomeFantasia}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsApp.acentLight),
                            );
                          }),
                          subtitle: Text(
                            "Nome",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Icon(CupertinoIcons.right_chevron),
                        ),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                ),
                Divider(),
                Container(
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        _editDescricao(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ListTile(
                          title: Obx(() {
                            return Text(
                              "${controller.company.value.descricao}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsApp.acentLight),
                            );
                          }),
                          subtitle: Text(
                            'Descrição',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Icon(CupertinoIcons.right_chevron),
                        ),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                ),
                Divider(),
                Container(
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        _editTypeCompany(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ListTile(
                          title: Obx(() {
                            return Text(
                              "${controller.labelTypeCompany.value}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsApp.acentLight),
                            );
                          }),
                          subtitle: Text(
                            'Tipo de Negócio',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Icon(CupertinoIcons.right_chevron),
                        ),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                ),
                Divider(),
                Container(
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        _editPhone(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ListTile(
                          title: Obx(() {
                            var telefone = "";
                            try{
                              telefone = UtilBrasilFields.obterTelefone(
                                  "${controller.company.value.phone}");
                            }catch(e){
                              telefone = controller.company.value.phone;
                              print(e);
                            }
                            return Text(
                              telefone,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsApp.acentLight),
                            );
                          }),
                          subtitle: Text(
                            'Telefone',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Icon(CupertinoIcons.right_chevron),
                        ),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                ),
                Divider(),
                Container(
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        _editPlace(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ListTile(
                          title: Obx(() {
                            return Text(
                              "${controller.place.value.city} - ${controller.place.value.state}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsApp.acentLight),
                            );
                          }),
                          subtitle: Text(
                            'Local',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Icon(CupertinoIcons.right_chevron),
                        ),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                ),
                Divider(),
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

  void _editName(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return BottomSheetName();
        });
  }

  void _editDescricao(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return BottomSheetDescricao();
        });
  }

  void _editPhone(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return BottomSheetPhone();
        });
  }

  void _editTypeCompany(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return BottomSheetTypeCompany();
        });
  }

  void _editPlace(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return BottomSheetPlace();
        });
  }
}
