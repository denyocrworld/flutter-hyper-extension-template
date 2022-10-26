import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//OLD VERSION
var primaryColor = Colors.blueGrey[800];
var secondaryColor = const Color(0xFF2A2D3E);
var bgColor = const Color(0xFF212332);
var defaultPadding = 16.0;

var dangerColor = Colors.red[300];
var successColor = Colors.green[300];
var infoColor = Colors.blue[300];
var warningColor = Colors.orange[300];
var disabledColor = Colors.grey[300];

var disabledTextColor = Colors.grey[800];
//--------

const double xs = 28;
const double sm = 38;
const double md = 50;
const double lg = 60;
const double xl = 70;

//---
//Text
Color fontColor = Colors.grey[700]!;

//Color
Color appbarBackgroundColor = Colors.white;
Color scaffoldBackgroundColor = Colors.grey[300]!;
MaterialColor primarySwatch = Colors.blueGrey;
TextStyle googleFont = GoogleFonts.sora();
Color drawerBackgroundColor = const Color(0xff404E67);

//drawer
Color drawerFontColor = Colors.grey[300]!;

double cardElevation = 0.8;
double cardBorderRadius = 24.0;

class MainTheme {}

ThemeData getDefaultTheme() {
  return ThemeData(
    // primarySwatch:  Color(0xffFA533C),
    primaryColor: primaryColor,
    primarySwatch: primarySwatch,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(64.0),
        ),
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: appbarBackgroundColor,
      elevation: 0.6,
      titleTextStyle: googleFont.copyWith(
        color: Colors.blueGrey[700],
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.blueGrey[700],
      ),
    ),
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    drawerTheme: DrawerThemeData(
      backgroundColor: drawerBackgroundColor,
    ),
    iconTheme: IconThemeData(
      color: fontColor,
    ),
    textTheme: TextTheme(
      bodyText1: googleFont.copyWith(color: fontColor),
      bodyText2: googleFont.copyWith(color: fontColor),
    ),
    cardTheme: CardTheme(
      elevation: cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
    ),
    chipTheme: const ChipThemeData(),
    tabBarTheme: TabBarTheme(
      labelColor: fontColor,
    ),
  );
}

ThemeData getDarkTheme() {
  return ThemeData.dark().copyWith(
    // primarySwatch:  Color(0xffFA533C),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     shape: ContinuousRectangleBorder(
    //       borderRadius: BorderRadius.circular(64.0),
    //     ),
    //     foregroundColor: Colors.white,
    //   ),
    // ),
    appBarTheme: AppBarTheme(
      backgroundColor: appbarBackgroundColor,
      elevation: 0.6,
      titleTextStyle: googleFont.copyWith(
        color: Colors.blueGrey[700],
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.blueGrey[700],
      ),
    ),
    // scaffoldBackgroundColor: scaffoldBackgroundColor,
    // drawerTheme: DrawerThemeData(
    //   backgroundColor: drawerBackgroundColor,
    // ),
    // iconTheme: IconThemeData(
    //   color: fontColor,
    // ),
    textTheme: TextTheme(
      bodyText1: googleFont.copyWith(
        color: fontColor,
      ),
      bodyText2: googleFont.copyWith(
        color: fontColor,
      ),
    ),
    cardTheme: CardTheme(
      elevation: cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
    ),
    // chipTheme: const ChipThemeData(),
    // tabBarTheme: TabBarTheme(
    //   labelColor: fontColor,
    // ),
  );
}

ThemeData getElegantTheme() {
  return ThemeData.dark().copyWith(
    primaryColor: const Color(0xff212332),
    // primarySwatch:  Color(0xffFA533C),
    canvasColor: const Color(0xff26354F),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     shape: ContinuousRectangleBorder(
    //       borderRadius: BorderRadius.circular(64.0),
    //     ),
    //     foregroundColor: Colors.white,
    //   ),
    // ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xff212332),
      elevation: 0.6,
      titleTextStyle: GoogleFonts.montserrat(
        color: Colors.blueGrey[700],
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xff2A2D3E),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      // backgroundColor: Color(0xff26354F),
      backgroundColor: Colors.red,
    ),
    // drawerTheme: DrawerThemeData(
    //   backgroundColor: drawerBackgroundColor,
    // ),
    // iconTheme: IconThemeData(
    //   color: fontColor,
    // ),
    textTheme: TextTheme(
      bodyText1: googleFont.copyWith(color: Colors.white),
      bodyText2: googleFont.copyWith(color: Colors.white),
    ),
    cardTheme: CardTheme(
      elevation: cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
    ),
    // chipTheme: const ChipThemeData(),
    // tabBarTheme: TabBarTheme(
    //   labelColor: fontColor,
    // ),
  );
}

ThemeData getOrangeTheme() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.orange[800],
    // primarySwatch:  Color(0xffFA533C),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     shape: ContinuousRectangleBorder(
    //       borderRadius: BorderRadius.circular(64.0),
    //     ),
    //     foregroundColor: Colors.white,
    //   ),
    // ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xff06283D),
      elevation: 0.6,
      titleTextStyle: GoogleFonts.montserrat(
        color: Colors.blueGrey[700],
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.blueGrey[700],
      ),
    ),
    scaffoldBackgroundColor: const Color(0xff256D85),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      // backgroundColor: Color(0xff26354F),
      backgroundColor: Colors.red,
    ),
    // drawerTheme: DrawerThemeData(
    //   backgroundColor: drawerBackgroundColor,
    // ),
    // iconTheme: IconThemeData(
    //   color: fontColor,
    // ),
    // textTheme: TextTheme(
    //   bodyText1: googleFont.copyWith(color: fontColor),
    //   bodyText2: googleFont.copyWith(color: fontColor),
    // ),
    cardTheme: CardTheme(
      color: const Color(0xff47B5FF),
      elevation: cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
    ),
    // chipTheme: const ChipThemeData(),
    // tabBarTheme: TabBarTheme(
    //   labelColor: fontColor,
    // ),
  );
}
