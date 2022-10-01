import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/uk_profile_view.dart';

class UkProfileController extends State<UkProfileView> implements MvcController {
  static late UkProfileController instance;
  late UkProfileView view;

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