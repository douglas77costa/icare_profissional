import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/modules/profile/tabs/personal/bottom_sheet_cpf.dart';
import 'package:icare_profissional/modules/profile/tabs/personal/personal_tab_controller.dart';
import 'package:icare_profissional/ui/colors.dart';

import 'bottom_sheet_email.dart';
import 'bottom_sheet_name.dart';
import 'bottom_sheet_password.dart';
import 'bottom_sheet_phone.dart';

class PersonalTab extends StatelessWidget {
  final PersonalController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 20),
                  child: Center(
                    child: Image.asset("images/register_image.png", fit: BoxFit.cover,width: 200,),
                  ),
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
                              "${controller.user.value.firstName} ${controller.user.value.lastName}",
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
                        _editCpf(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ListTile(
                          title: Obx(() {
                            return Text(
                              "${controller.user.value.cpf}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsApp.acentLight),
                            );
                          }),
                          subtitle: Text(
                            'CPF',
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
                       _editEmail(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ListTile(
                          title: Obx(() {
                            return Text(
                              "${controller.user.value.email}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsApp.acentLight),
                            );
                          }),
                          subtitle: Text(
                            'Email',
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
                                  "${controller.user.value.phone}");
                            }catch(e){
                              telefone = controller.user.value.phone;
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
                        _editPassword(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ListTile(
                          title: Text(
                            "****",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: ColorsApp.acentLight),
                          ),
                          subtitle: Text(
                            'Senha',
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

  void _editCpf(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return BottomSheetCPF();
        });
  }

  void _editEmail(context) {
   showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return BottomSheetEmail();
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

  void _editPassword(context) {
     showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return BottomSheetPassword();
        });

  }
}
