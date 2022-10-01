import 'dart:io';

import 'package:fhe_template/core.dart';
import 'package:fhe_template/setup.dart';
import 'package:fhe_template/shared/theme/theme.dart';
import 'package:fhe_template/state_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'module/welcome/view/welcome_view.dart';

void main() async {
  await initialize();

  Widget mainView = const WelcomeView();
  if (Platform.isAndroid) {
    if (FirebaseAuth.instance.currentUser != null) {
      mainView = const MainNavigationView();
    }
  }

  runApp(
    MaterialApp(
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: defaultTheme,
      home: mainView,
    ),
  );
}
