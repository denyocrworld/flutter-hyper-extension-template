import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/debug_view.dart';

class DebugController extends State<DebugView> implements MvcController {
  static late DebugController instance;
  late DebugView view;

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