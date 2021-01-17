import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/modules/profile/tabs/business/bottom_sheet_descricao.dart';
import 'package:icare_profissional/modules/profile/tabs/business/bottom_sheet_phone.dart';
import 'package:icare_profissional/modules/profile/tabs/business/bottom_sheet_place.dart';
import 'package:icare_profissional/ui/colors.dart';

import '../../profile_controller.dart';
import 'bottom_sheet_name.dart';
import 'bottom_sheet_type_company.dart';

class BusinessTab extends StatelessWidget {
  final ProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150,
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  child: Obx(() {
                    return Center(
                      child: CircleAvatar(
                        radius: 110,
                        backgroundColor: ColorsApp.acent,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: ColorsApp.acent,
                          backgroundImage: NetworkImage(
                              "${controller.company.value.srcImage}"),
                        ),
                      ),
                    );
                  }),
                ),
                Obx(() {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Center(
                      child: Text(
                        "${controller.company.value.nomeFantasia}",
                        style: TextStyle(color: ColorsApp.acent, fontSize: 30),
                      ),
                    ),
                  );
                }),
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
                            return Text(
                              UtilBrasilFields.obterTelefone("${controller.company.value.phone}"),
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
