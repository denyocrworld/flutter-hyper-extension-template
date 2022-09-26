import 'package:flutter/material.dart';

class BasicList extends StatefulWidget {
  final List items;
  final Function(dynamic item) onItemBuild;
  const BasicList({
    Key? key,
    required this.onItemBuild,
    required this.items,
  }) : super(key: key);

  @override
  State<BasicList> createState() => _BasicListState();
}

class _BasicListState extends State<BasicList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var item = widget.items[index];
        return widget.onItemBuild(item);
      },
    );
  }
}
