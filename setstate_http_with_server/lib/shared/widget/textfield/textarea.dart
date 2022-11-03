import 'package:example/core.dart';
import 'package:flutter/material.dart';

class ExTextArea extends StatelessWidget {
  final String id;
  final String label;
  final int maxLines;
  final String? value;

  const ExTextArea({
    Key? key,
    required this.id,
    required this.label,
    this.maxLines = 6,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExTextField(
      id: id,
      label: label,
      maxLines: maxLines,
      value: value,
    );
  }
}

Widget contoh() {
  return FutureBuilder(
    future: Dio().get(
      "http://localhost:8080/api/blogs",
      options: Options(
        contentType: "application/json",
        headers: {
          "Authorization": "Bearer dev_token",
        },
      ),
    ),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.data == null) return Container();
      Response response = snapshot.data;
      Map obj = response.data;
      List items = obj["data"];
      return ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(
                  item["avatar"],
                ),
              ),
              title: Text("${item["first_name"]}"),
              subtitle: Text("${item["email"]}"),
            ),
          );
        },
      );
    },
  );
}
