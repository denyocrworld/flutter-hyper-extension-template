import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ExtremeList extends StatefulWidget {
  final String url;
  final Function(dynamic item) onItemBuild;
  const ExtremeList({
    Key? key,
    required this.url,
    required this.onItemBuild,
  }) : super(key: key);

  @override
  State<ExtremeList> createState() => _ExtremeListState();
}

class _ExtremeListState extends State<ExtremeList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Dio().get(
        widget.url,
        options: Options(
          contentType: "application/json",
        ),
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        debugPrint("snapshot.data: ${snapshot.data}");
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

            return widget.onItemBuild(item);
          },
        );
      },
    );
  }
}
