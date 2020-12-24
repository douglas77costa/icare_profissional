import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:icare_profissional/data/model/company/company.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/modules/register/register_bind.dart';
import 'package:icare_profissional/modules/register/register_page.dart';
import 'package:icare_profissional/modules/splash/splash_page.dart';
import 'package:icare_profissional/ui/app_theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'modules/home/home_page.dart';
import 'modules/main/main_bind.dart';
import 'modules/main/main_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  await Hive.init(directory.path);
  Hive.registerAdapter<User>(UserAdapter());
  Hive.registerAdapter<Company>(CompanyAdapter());
  runApp(IcareApp());
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
      home: SplashPage(),
      darkTheme: appThemeData(context),
      theme: appThemeData(context),
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(
          name: "/",
          page: () => SplashPage(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
            name: '/register',
            page: () => RegisterPage(),
            binding: RegisterBind()),
        GetPage(
            name: '/main',
            page: () => MainPage(),
            binding: MainBind()),
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
