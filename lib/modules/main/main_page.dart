import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:icare_profissional/modules/dashboard/dashboard_page.dart';
import 'package:icare_profissional/modules/main/main_controller.dart';
import 'package:icare_profissional/modules/menu/menu_page.dart';
import 'package:icare_profissional/modules/notification/notification_page.dart';
import 'package:icare_profissional/modules/schedule/schedule_page.dart';
import 'package:icare_profissional/modules/search/search_page.dart';
import 'package:icare_profissional/modules/services/services_page.dart';
import 'package:icare_profissional/ui/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainPage extends StatelessWidget {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  final MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            backgroundColor: ColorsApp.primary,
            decoration: NavBarDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0, // soften the shadow
                  spreadRadius:0.5, //extend the shadow
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    1.0, // Move to bottom 10 Vertically
                  ),
                )
              ]
            ),
            navBarStyle:
            NavBarStyle.style3,
            screenTransitionAnimation: ScreenTransitionAnimation(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 300),
              animateTabTransition: true
            ),// Choose the nav bar style with this property.
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

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(LineIcons.home),
          title: ("Dashboard"),
          inactiveColor: Colors.white,
          activeColor: ColorsApp.acent),
      PersistentBottomNavBarItem(
          icon: Icon(LineIcons.calendar_check_o),
          title: ("Agenda"),
          inactiveColor: Colors.white,
          activeColor: ColorsApp.acent),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.search),
          title: ("Pesquisa"),
          inactiveColor: Colors.white,
          activeColor: ColorsApp.acent),
      PersistentBottomNavBarItem(
          icon: Icon(LineIcons.bars),
          title: ("Mais"),
          inactiveColor: Colors.white,
          activeColor: ColorsApp.acent),
    ];
  }

  List<Widget> _buildScreens() {
    return [DashboardPage(),SchedulePage(), SearchPage(), MenuPage()];
  }

  //ServicesPage(
//icon: Icon(LineIcons.tag),
}
