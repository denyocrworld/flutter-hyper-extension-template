// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:fhe_template/router/router.dart';
import 'package:fhe_template/setup.dart';
import 'package:fhe_template/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

void main() async {
  await initialize();
  runApp(const ShellRouteExampleApp());
}

/// An example demonstrating how to use [ShellRoute]
class ShellRouteExampleApp extends StatelessWidget {
  /// Creates a [ShellRouteExampleApp]
  const ShellRouteExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: defaultTheme,
      routerConfig: getRouters(context, rootNavigatorKey, shellNavigatorKey),
    );
  }
}
