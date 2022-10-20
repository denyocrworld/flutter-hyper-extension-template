import 'dart:io';

import 'package:example/core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() async {
  await initialize();

  var path = Directory.current.path;
  Hive.init(path);
  await ThemeService.loadTheme();

  runApp(MaterialApp(
    navigatorKey: Get.navigatorKey,
    title: 'Example',
    debugShowCheckedModeBanner: false,
    // theme: ThemeService.mainTheme,
    home: const DashboardView(),
    // home: const DemoView(),
  ));
}

/*
? How to change icon:
1. Add image to assets/icon/icon.png
2. Run this command:
  
  flutter pub run flutter_launcher_icons:main

*/