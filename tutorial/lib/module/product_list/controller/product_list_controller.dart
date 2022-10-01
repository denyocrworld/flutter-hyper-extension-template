import 'package:fhe_template/shared/widget/list/list.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/product_list_view.dart';

class ProductListController extends State<ProductListView>
    implements MvcController {
  static late ProductListController instance;
  late ProductListView view;
  String search = "";

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  updateSearch(value) {
    search = value;
    // update();
    QListView.instance["product_list"]!.query["search"] = value;
    QListView.instance["product_list"]!.onRefresh();
    update();
  }
}
