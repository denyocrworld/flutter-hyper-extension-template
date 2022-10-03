import 'package:flutter/material.dart';
import '../controller/report_controller.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  Widget build(context, ReportController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Report"),
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
  State<ReportView> createState() => ReportController();
}