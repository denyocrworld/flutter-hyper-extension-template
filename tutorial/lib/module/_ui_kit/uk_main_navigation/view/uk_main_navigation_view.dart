import 'package:flutter/material.dart';
import '../controller/uk_main_navigation_controller.dart';

class UkMainNavigationView extends StatefulWidget {
  const UkMainNavigationView({Key? key}) : super(key: key);

  Widget build(context, UkMainNavigationController controller) {
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
              Text("Save"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<UkMainNavigationView> createState() => UkMainNavigationController();
}
