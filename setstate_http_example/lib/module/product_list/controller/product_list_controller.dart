import 'package:dio/dio.dart';
import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

class ProductListController extends State<ProductListView>
    implements MvcController {
  static late ProductListController instance;
  late ProductListView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  openProductCreateForm() async {
    await Get.to(const ProductFormView());
    update();
  }

  openProductEditForm(Map item) async {
    await Get.to(ProductFormView(
      item: item,
    ));
    update();
  }

  deleteProduct(int id) async {
    await Dio().delete(
      "http://localhost:8080/dynamic-api/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    update();
  }
}
