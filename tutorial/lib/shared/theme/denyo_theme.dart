import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var denyoTheme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
  primaryColor: Colors.red[300],
  primarySwatch: Colors.red,
  primaryIconTheme: const IconThemeData.fallback().copyWith(
    color: Colors.black,
  ),
  iconTheme: const IconThemeData.fallback().copyWith(
    color: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey[900]!,
    elevation: 0.0,
    centerTitle: true,
  ),
  primaryTextTheme: const TextTheme(
    headline6: TextStyle(
      color: Colors.black,
    ),
  ),
);

getUiKitTheme() {
  return ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    primaryColor: Colors.red[300],
    primarySwatch: Colors.blue,
    primaryIconTheme: const IconThemeData.fallback().copyWith(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData.fallback().copyWith(
      color: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.blueGrey[900],
      ),
    ),
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
