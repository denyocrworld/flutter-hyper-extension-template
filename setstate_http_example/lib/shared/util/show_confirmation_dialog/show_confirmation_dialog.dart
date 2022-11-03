import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

Future<bool> showConfirmationDialog({
  String? message,
}) async {
  bool confirm = false;
  await showDialog<void>(
    context: Get.currentContext,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message ?? 'Are you sure you want to delete this item?'),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[600],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("No"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
            ),
            onPressed: () {
              confirm = true;
              Navigator.pop(context);
            },
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );

  return Future.value(confirm);
}
