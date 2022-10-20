import 'dart:io';
import 'package:flutter/foundation.dart';

bool get isIOS => !kIsWeb && Platform.isIOS;
bool get isMacOS => !kIsWeb && Platform.isMacOS;
bool get isAndroid => !kIsWeb && Platform.isAndroid;
bool get isWindows => !kIsWeb && Platform.isWindows;
bool get isLinux => !kIsWeb && Platform.isLinux;
bool get isFuchsia => !kIsWeb && Platform.isFuchsia;
bool get isWeb => kIsWeb;
