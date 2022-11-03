import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/product_form_view.dart';

class ProductFormController extends State<ProductFormView>
    implements MvcController {
  static late ProductFormController instance;
  late ProductFormView view;

  String? productName;
  double? price;

  bool get isEditMode {
    return view.item != null;
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String get title {
    if (isEditMode) {
      return "Update Product";
    } else {
      return "Create Product";
    }
  }

  save() async {
    if (isEditMode) {
      productName = productName ?? view.item!["name"];
      price = price ?? view.item!["price"];

      var id = view.item!["id"];
      var response = await Dio().post(
        "http://localhost:8080/dynamic-api/products/$id",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "name": productName,
          "price": price,
        },
      );
    } else {
      var response = await Dio().post(
        "http://localhost:8080/dynamic-api/products",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "name": productName,
          "price": price,
        },
      );
    }

    Get.back();
  }
}
