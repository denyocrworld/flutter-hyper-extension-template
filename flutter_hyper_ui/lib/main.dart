import 'package:example/setup.dart';
import 'package:flutter/material.dart';
import 'shared/theme/theme.dart';

void main() async {
  await initialize();

  runApp(MaterialApp(
    title: 'Example',
    debugShowCheckedModeBanner: false,
    theme: getDefaultTheme(),
    home: Container(),
  ));
}

/*
TODO: How to change icon:
1. Add image to assets/icon/icon.png
2. Run this command:
  
  flutter pub run flutter_launcher_icons:main

*/