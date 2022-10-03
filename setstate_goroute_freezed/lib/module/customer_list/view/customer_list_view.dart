import 'package:flutter/material.dart';
import '../controller/customer_list_controller.dart';

class CustomerListView extends StatefulWidget {
  const CustomerListView({Key? key}) : super(key: key);

  Widget build(context, CustomerListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("CustomerList"),
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
  State<CustomerListView> createState() => CustomerListController();
}