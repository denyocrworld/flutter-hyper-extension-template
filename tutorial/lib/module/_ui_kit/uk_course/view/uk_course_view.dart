import 'package:flutter/material.dart';
import '../controller/uk_course_controller.dart';

class UkCourseView extends StatefulWidget {
  const UkCourseView({Key? key}) : super(key: key);

  Widget build(context, UkCourseController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              //body
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<UkCourseView> createState() => UkCourseController();
}