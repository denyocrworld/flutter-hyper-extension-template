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
