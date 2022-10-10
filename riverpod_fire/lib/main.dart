import 'package:fhe_template/riverpod_util.dart';
import 'package:fhe_template/setup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await initialize();

  Widget mainView = Container();
  if (FirebaseAuth.instance.currentUser != null) {
    mainView = Container();
  }

  runApp(
    ProviderScope(
      child: MaterialApp(
        navigatorKey: Get.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: mainView,
      ),
    ),
  );
}
