import 'package:flutter/material.dart';
import '../controller/uk_profile_controller.dart';

class UkProfileView extends StatefulWidget {
  const UkProfileView({Key? key}) : super(key: key);

  Widget build(context, UkProfileController controller) {
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
  State<UkProfileView> createState() => UkProfileController();
}