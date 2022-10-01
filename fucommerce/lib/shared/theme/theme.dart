import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var defaultTheme = ThemeData(
  // primarySwatch:  Color(0xffFA533C),
  primaryColor: const Color(0xffFA533C),
  primarySwatch: Colors.orange,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(64.0),
      ),
      foregroundColor: Colors.white,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey[50],
    elevation: 0.0,
    titleTextStyle: GoogleFonts.montserrat(
      color: Colors.blueGrey[700],
    ),
    iconTheme: IconThemeData(
      color: Colors.blueGrey[700],
    ),
  ),
  scaffoldBackgroundColor: Colors.blueGrey[50],
  // textTheme: GoogleFonts.montserratTextTheme().copyWith(
  textTheme: GoogleFonts.montserratTextTheme().copyWith(
    bodyText1: TextStyle(
      color: Colors.blueGrey[700],
    ),
    bodyText2: TextStyle(
      color: Colors.blueGrey[700],
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.blueGrey[700],
  ),
  cardTheme: CardTheme(
    elevation: 0.8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    ),
  ),
);
