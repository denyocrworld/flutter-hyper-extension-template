import 'package:flutter/material.dart';
import '../controller/setting_controller.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  Widget build(context, SettingController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
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
  State<SettingView> createState() => SettingController();
}