import 'package:fhe_template/core.dart';
import 'package:fhe_template/setup.dart';
import 'package:fhe_template/shared/theme/denyo_theme.dart';
import 'package:fhe_template/state_util.dart';
import 'package:flutter/material.dart';

void main() async {
  await initialize();
  Widget mainView = Container();
  // if (FirebaseAuth.instance.currentUser != null) {
  //   mainView = Container();
  // }

  runApp(
    MaterialApp(
      navigatorKey: Get.navigatorKey,
      title: 'Flutter Demo',
      theme: denyoTheme,
      home: const ContohView(),
    ),
  );
}
