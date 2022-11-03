import 'package:example/core.dart';
import 'package:flutter/material.dart';

void main() async {
  await initialize();

  return runApp(MaterialApp(
    title: 'Capek Ngoding',
    debugShowCheckedModeBanner: false,
    theme: getDarkTheme(),
    home: const DebugView(),
  ));
}
