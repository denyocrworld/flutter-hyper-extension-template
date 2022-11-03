import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        actions: const [],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: const Text("HTTP with FutureBuilder"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () => Get.to(const DashboardView()),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: const Text("HTTP from Controller"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[300],
              ),
              onPressed: () => Get.to(const DashboardHttpFromControllerView()),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: const Text("CRUD Products"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () => Get.to(const ProductListView()),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
