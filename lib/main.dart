import 'dart:io';
import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:icare_profissional/data/model/company/company.dart';
import 'package:icare_profissional/data/model/token/token.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/modules/register/register_bind.dart';
import 'package:icare_profissional/modules/register/register_page.dart';
import 'package:icare_profissional/modules/splash/splash_bind.dart';
import 'package:icare_profissional/modules/splash/splash_page.dart';
import 'package:icare_profissional/ui/app_theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'modules/home/home_page.dart';
import 'modules/login/login_bind.dart';
import 'modules/login/login_page.dart';
import 'modules/main/main_bind.dart';
import 'modules/main/main_page.dart';
import 'modules/menu/menu_bind.dart';
import 'modules/menu/menu_page.dart';
import 'modules/profile/profile_bind.dart';
import 'modules/profile/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(IcareApp());
}


Future initHive()async{
  Directory directory = await getApplicationDocumentsDirectory();
  await Hive.init(directory.path);
  Hive.registerAdapter<User>(UserAdapter());
  Hive.registerAdapter<Company>(CompanyAdapter());
  Hive.registerAdapter<Token>(TokenAdapter());
}

class IcareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    final botToastBuilder = BotToastInit();
    Firebase.initializeApp();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      darkTheme: appThemeData(context),
      theme: appThemeData(context),
      defaultTransition: Transition.fade,
      getPages: [
        GetPage(name: "/",
          page: () => SplashPage(),
          binding: SplashBind()
        ),
        GetPage(name: '/home',
          page: () => HomePage(),
        ),
        GetPage(name: '/login',
            page: () => LoginPage(), binding: LoginBind()),
        GetPage(name: '/register',
            page: () => RegisterPage(), binding: RegisterBind()),
        GetPage(name: '/main',
            page: () => MainPage(), binding: MainBind()),
        GetPage(name: '/menu',
            page: () => MenuPage(), binding: MenuBind()),
        GetPage(name: '/profile',
            page: () => ProfilePage(), binding: ProfileBind()),
      ],
      builder: (context, child) {
        child = ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child),
            maxWidth: 1920,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(color: Color(0xFFF5F5F5))); //do something
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
