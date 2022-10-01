import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/uk_course_view.dart';

class UkCourseController extends State<UkCourseView> implements MvcController {
  static late UkCourseController instance;
  late UkCourseView view;

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