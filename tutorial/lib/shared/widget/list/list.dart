import 'package:flutter/material.dart';

class QListView extends StatefulWidget {
  static Map<String, QListViewState> instance = {};
  final String id;
  final Function(
    int page,
    Map query,
  ) getFuture;

  final Function(Map<String, dynamic> item, int index) itemBuilder;
  const QListView({
    Key? key,
    required this.id,
    required this.getFuture,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  State<QListView> createState() => QListViewState();
}

class QListViewState extends State<QListView> {
  List items = [];
  int page = 1;
  Map query = {};

  late ScrollController scrollController;

  onRefresh() async {
    page = 1;
    var response = await widget.getFuture(page, query);
    items = response["data"];
    setState(() {});
  }

  nextPage() async {
    page++;
    var response = await widget.getFuture(page, query);
    var newItems = response["data"];
    items.addAll(newItems);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    QListView.instance[widget.id] = this;
    scrollController = ScrollController();
    scrollController.addListener(() {
      debugPrint("scrollController.offset: ${scrollController.offset}");
      debugPrint(
          "scrollController.position.maxScrollExtent: ${scrollController.position.maxScrollExtent}");
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        debugPrint("You are in the bottom");
        nextPage();
      }
    });
    onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh(),
      child: ListView.builder(
        controller: scrollController,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return widget.itemBuilder(item, index);
        },
      ),
    );
  }
}
