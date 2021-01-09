import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: ColorsApp.primary,
        navBarStyle:
            NavBarStyle.style3, // Choose the nav bar style with this property.
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
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
          icon: Icon(LineIcons.tag),
          title: ("Serviços"),
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
    return [SchedulePage(), SearchPage(),ServicesPage(), MenuPage()];
  }
}
