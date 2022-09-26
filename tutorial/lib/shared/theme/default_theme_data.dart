import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var defaultThemeData = ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Colors.grey[100],
  cardTheme: CardTheme(
    elevation: 10.0,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(64.0),
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.grey[800],
  ),
  appBarTheme: AppBarTheme(
    elevation: 10.0,
    backgroundColor: Colors.blueGrey[900],
    titleTextStyle: GoogleFonts.montserrat(),
    actionsIconTheme: const IconThemeData(
      color: Colors.red,
    ),
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 164, 142, 140),
    ),
  ),
  textTheme: GoogleFonts.robotoMonoTextTheme().copyWith(
    headline1: TextStyle(
      color: Colors.grey[800],
    ),
    headline2: TextStyle(
      color: Colors.grey[800],
    ),
    bodyText1: TextStyle(
      color: Colors.grey[800],
    ),
    bodyText2: TextStyle(
      color: Colors.grey[800],
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.red[100],
    elevation: 10.0,
    selectedItemColor: Colors.red,
  ),
  dialogBackgroundColor: Colors.orange[300],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(64.0),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.orange,
      ),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.green[100],
  ),
);
