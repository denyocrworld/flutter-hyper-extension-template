import 'package:flutter/material.dart';
import '../controller/uk_dashboard_controller.dart';

class UkDashboardView extends StatefulWidget {
  const UkDashboardView({Key? key}) : super(key: key);

  Widget build(context, UkDashboardController controller) {
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
  State<UkDashboardView> createState() => UkDashboardController();
}