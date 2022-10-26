import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class QListView extends StatelessWidget {
  final Future onFuture;
  final Function(int, Map<String, dynamic>) itemBuilder;
  final String rootNode;

  const QListView({
    Key? key,
    required this.onFuture,
    required this.itemBuilder,
    this.rootNode = "data",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: onFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) return Container();
        Response response = snapshot.data;
        Map obj = response.data;
        List items = obj[rootNode];

        return ListView.builder(
          itemCount: items.length,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var item = items[index];
            return itemBuilder(index, item);
          },
        );
      },
    );
  }
}
