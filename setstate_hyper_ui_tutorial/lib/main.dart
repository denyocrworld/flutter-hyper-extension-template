import 'package:example/core.dart';
import 'package:flutter/material.dart';

void main() async {
  await initialize();

  runApp(const MaterialApp(
    title: 'Example',
    debugShowCheckedModeBanner: false,
    // theme: getDefaultTheme(),
    home: DashboardView(),
  ));
}

/*
? How to change icon:
1. Add image to assets/icon/icon.png
2. Run this command:
  
  flutter pub run flutter_launcher_icons:main

*/