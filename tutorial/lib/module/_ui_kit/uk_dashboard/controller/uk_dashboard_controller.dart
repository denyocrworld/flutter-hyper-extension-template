import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/uk_dashboard_view.dart';

class UkDashboardController extends State<UkDashboardView> implements MvcController {
  static late UkDashboardController instance;
  late UkDashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}