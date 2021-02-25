import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:icare_profissional/ui/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'menu_controller.dart';

class MenuPage extends StatelessWidget {
  final MenuController controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
          title: Text("Menu"),
          elevation: 2,
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Material(
              child: InkWell(
                onTap: () {
                  Get.offAllNamed("/profile");
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ListTile(
                    leading: GFAvatar(
                      backgroundImage:
                          NetworkImage("${controller.company.value.srcImage}"),
                      radius: 30,
                    ),
                    title: Text(
                      "${controller.company.value.nomeFantasia}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: ColorsApp.acentLight),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        'Meu perfil e dados comerciais',
                        style: TextStyle(color: Colors.white),
                      ),
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
                  Get.offAllNamed("/services");
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ListTile(
                    leading: GFAvatar(
                      child: Icon(LineIcons.tag,
                          size: 30, color: ColorsApp.acentLight),
                      radius: 30,
                    ),
                    title: Text(
                      "Serviços",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      'Gerenciar serviços',
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
                  print("tapped");
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ListTile(
                    leading: GFAvatar(
                      child: Icon(LineIcons.bell,
                          size: 30, color: ColorsApp.acentLight),
                      radius: 30,
                    ),
                    title: Text(
                      "Noticações",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      'Central de notificações',
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
                  print("tapped");
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ListTile(
                    leading: GFAvatar(
                      child: Icon(LineIcons.cog,
                          size: 30, color: ColorsApp.acentLight),
                      radius: 30,
                    ),
                    title: Text(
                      "Configurações",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      'Ajustes do App',
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
                  Alert(
                    context: context,
                    style: AlertStyle(
                        animationType: AnimationType.grow,
                        alertBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        titleStyle: TextStyle(color: Colors.white)),
                    type: AlertType.warning,
                    title: "Tem certeza que deseja sair?",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Não",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () =>Navigator.of(context, rootNavigator: true).pop(),
                        color: ColorsApp.acentDark,
                      ),
                      DialogButton(
                        child: Text(
                          "Sair",
                          style: TextStyle(
                              color: ColorsApp.acentDark, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                          controller.logOut();
                        },
                        color: Colors.white,
                      )
                    ],
                  ).show();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ListTile(
                    leading: GFAvatar(
                      child: Icon(
                        LineIcons.sign_out,
                        size: 30,
                        color: ColorsApp.acentLight,
                      ),
                      radius: 30,
                    ),
                    title: Text(
                      "Desconectar",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      'Sair da sua conta',
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
    );
  }
}
