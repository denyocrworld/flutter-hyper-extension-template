import 'dart:io';

import 'package:example/core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeService {
  static Box box = Hive.box("themeStorage");
  static ThemeData mainTheme = ThemeData();
  static List<ThemeData> themeList = [
    getDefaultTheme(),
    getDarkTheme(),
    getOrangeTheme(),
  ];
  static saveTheme(themeIndex) async {
    mainTheme = themeList[themeIndex];
    box.put("theme_index", themeIndex);
  }

  static loadTheme() async {
    var path = Directory.current.path;
    Hive.init(path);
    await Hive.openBox("themeStorage");

    var themeIndex = box.get("theme_index") ?? 0;
    mainTheme = themeList[themeIndex];
  }
}
