import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData appThemeData(BuildContext context) {
  return ThemeData(
      primaryColor: ColorsApp.primary,
      accentColor: ColorsApp.acent,
      primaryColorDark: ColorsApp.primaryDark,
      primaryColorLight: ColorsApp.primaryLight,
      cursorColor: ColorsApp.acent,
      brightness: Brightness.dark,
      textSelectionTheme: TextSelectionThemeData(cursorColor: ColorsApp.acent),
      textTheme: GoogleFonts.asapTextTheme(
        Theme.of(context).textTheme.apply(
          bodyColor: Colors.white
        ),
      ),
  );
}
