import 'package:fhe_template/model/product/product.dart';
import 'package:fhe_template/service/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/cart_view.dart';

class CartController extends State<CartView> implements MvcController {
  static late CartController instance;
  late CartView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  deleteAll() async {
    CartService.deleteAll();
    update();
  }

  addQty(Product product) {
    CartService.addQty(product);
    update();
  }

  decQty(Product product) {
    CartService.decQty(product);
    update();
  }
}
