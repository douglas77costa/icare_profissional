import 'dart:io';
import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:icare_profissional/data/model/company/company.dart';
import 'package:icare_profissional/data/model/token/token.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/routes/routes.dart';
import 'package:icare_profissional/ui/app_theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(IcareApp());
}

Future initHive()async{
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter<User>(UserAdapter());
  Hive.registerAdapter<Company>(CompanyAdapter());
  Hive.registerAdapter<Token>(TokenAdapter());
}

void init(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  Firebase.initializeApp();
}

class IcareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onInit: init,
      darkTheme: appThemeData(context),
      theme: appThemeData(context),
      defaultTransition: Transition.fade,
      getPages: routes,
      builder: (context, child) {
        child = ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child),
            maxWidth: 1920,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.autoScale(480, name: MOBILE),
              ResponsiveBreakpoint.resize(600, name: MOBILE),
              ResponsiveBreakpoint.resize(850, name: TABLET),
              ResponsiveBreakpoint.resize(1080, name: DESKTOP),
            ],
            background: Container(color: Color(0xFFF5F5F5))); //do something
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }


}
