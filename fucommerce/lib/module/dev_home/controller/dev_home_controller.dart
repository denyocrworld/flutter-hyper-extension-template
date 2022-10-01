import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/dev_home_view.dart';

class DevHomeController extends State<DevHomeView> implements MvcController {
  static late DevHomeController instance;
  late DevHomeView view;

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
