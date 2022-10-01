import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/contoh_view.dart';

class ContohController extends State<ContohView> implements MvcController {
  static late ContohController instance;
  late ContohView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List items = [
    {
      "product_name": "Product 1",
      "price": 25,
    },
    {
      "product_name": "Product 2",
      "price": 25,
    },
    {
      "product_name": "Product 3",
      "price": 25,
    },
    {
      "product_name": "Product 4",
      "price": 25,
    },
    {
      "product_name": "Product 5",
      "price": 25,
    },
    {
      "product_name": "Product 6",
      "price": 25,
    },
    {
      "product_name": "Product 7",
      "price": 25,
    },
    {
      "product_name": "Product 8",
      "price": 25,
    },
    {
      "product_name": "Product 9",
      "price": 25,
    },
    {
      "product_name": "Product 10",
      "price": 25,
    },
    {
      "product_name": "Product 11",
      "price": 25,
    },
    {
      "product_name": "Product 12",
      "price": 25,
    },
    {
      "product_name": "Product 13",
      "price": 25,
    }
  ];
}
