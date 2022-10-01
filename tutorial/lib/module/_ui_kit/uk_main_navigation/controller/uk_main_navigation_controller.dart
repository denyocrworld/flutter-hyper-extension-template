import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/uk_main_navigation_view.dart';

class UkMainNavigationController extends State<UkMainNavigationView> implements MvcController {
  static late UkMainNavigationController instance;
  late UkMainNavigationView view;

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