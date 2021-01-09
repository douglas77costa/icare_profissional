import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/tabs/gf_tabbar_view.dart';
import 'package:getwidget/components/tabs/gf_tabs.dart';
import 'package:icare_profissional/modules/profile/profile_controller.dart';
import 'package:icare_profissional/modules/profile/tabs/business/business_tab.dart';
import 'package:icare_profissional/modules/profile/tabs/personal/personal_tab.dart';
import 'package:icare_profissional/ui/colors.dart';
import 'package:line_icons/line_icons.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        elevation: 0,
        title: Text("Contas"),
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
      body: GFTabs(
        tabBarColor: ColorsApp.primary,
        initialIndex: 0,
        length: 2,
        height: double.infinity,
        indicatorColor: ColorsApp.acent,
        tabs: <Widget>[
          Tab(
            icon: Icon(LineIcons.briefcase,size: 40,),
            child: Text(
              "Perfil Comercial",
            ),
          ),
          Tab(
            icon: Icon(LineIcons.user,size: 40,),
            child: Text(
              "Perfil Pessoal",
            ),
          ),
        ],
        tabBarView: GFTabBarView(
          children: <Widget>[
            BusinessTab(),
            PersonalTab()
          ],
        ),
      ),
    );
  }
}
