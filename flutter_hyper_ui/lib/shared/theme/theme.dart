import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTheme {
  //Text
  static Color fontColor = Colors.grey[700]!;

  //Color
  static Color appbarBackgroundColor = Colors.white;
  static Color primaryColor = Colors.blueGrey;
  static Color scaffoldBackgroundColor = Colors.grey[300]!;
  static MaterialColor primarySwatch = Colors.blueGrey;
  static TextStyle googleFont = GoogleFonts.sora();
  static Color drawerBackgroundColor = const Color(0xff404E67);

  //drawer
  static Color drawerFontColor = Colors.grey[300]!;

  static double cardElevation = 0.8;
  static double cardBorderRadius = 24.0;
}

ThemeData getDefaultTheme() {
  return ThemeData(
    // primarySwatch:  Color(0xffFA533C),
    primaryColor: MainTheme.primaryColor,
    primarySwatch: MainTheme.primarySwatch,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(64.0),
        ),
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: MainTheme.appbarBackgroundColor,
      elevation: 0.6,
      titleTextStyle: GoogleFonts.montserrat(
        color: Colors.blueGrey[700],
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.blueGrey[700],
      ),
    ),
    scaffoldBackgroundColor: MainTheme.scaffoldBackgroundColor,
    drawerTheme: DrawerThemeData(
      backgroundColor: MainTheme.drawerBackgroundColor,
    ),
    iconTheme: IconThemeData(
      color: MainTheme.fontColor,
    ),
    textTheme: TextTheme(
      bodyText1: MainTheme.googleFont.copyWith(color: MainTheme.fontColor),
      bodyText2: MainTheme.googleFont.copyWith(color: MainTheme.fontColor),
    ),
    cardTheme: CardTheme(
      elevation: MainTheme.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MainTheme.cardBorderRadius),
      ),
    ),
    chipTheme: const ChipThemeData(),
    tabBarTheme: TabBarTheme(
      labelColor: MainTheme.fontColor,
    ),
  );
}
