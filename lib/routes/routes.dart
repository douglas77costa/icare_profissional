import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:icare_profissional/modules/home/home_page.dart';
import 'package:icare_profissional/modules/login/login_bind.dart';
import 'package:icare_profissional/modules/login/login_page.dart';
import 'package:icare_profissional/modules/main/main_bind.dart';
import 'package:icare_profissional/modules/main/main_page.dart';
import 'package:icare_profissional/modules/menu/menu_bind.dart';
import 'package:icare_profissional/modules/menu/menu_page.dart';
import 'package:icare_profissional/modules/profile/profile_bind.dart';
import 'package:icare_profissional/modules/profile/profile_page.dart';
import 'package:icare_profissional/modules/register/register_bind.dart';
import 'package:icare_profissional/modules/register/register_page.dart';
import 'package:icare_profissional/modules/splash/splash_bind.dart';
import 'package:icare_profissional/modules/splash/splash_page.dart';

final List<GetPage> routes = [
  GetPage(name: "/", page: () => SplashPage(), binding: SplashBind()),
  GetPage(name: '/home', page: () => HomePage(),),
  GetPage(name: '/login', page: () => LoginPage(), binding: LoginBind()),
  GetPage(name: '/register', page: () => RegisterPage(), binding: RegisterBind()),
  GetPage(name: '/main', page: () => MainPage(), binding: MainBind()),
  GetPage(name: '/menu', page: () => MenuPage(), binding: MenuBind()),
  GetPage(name: '/profile', page: () => ProfilePage(), binding: ProfileBind()),
];
