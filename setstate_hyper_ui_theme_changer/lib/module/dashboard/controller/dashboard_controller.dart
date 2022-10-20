import 'package:example/core.dart';
import 'package:example/service/theme_service.dart';
import 'package:flutter/material.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  changeThemeTo(themeIndex) async {
    await ThemeService.saveTheme(themeIndex);
    update();
  }
}
