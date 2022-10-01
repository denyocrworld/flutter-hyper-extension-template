import 'package:fhe_template/core.dart';
import 'package:fhe_template/service/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';

class ProductDetailController extends State<ProductDetailView>
    implements MvcController {
  static late ProductDetailController instance;
  late ProductDetailView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int qty = 1;

  addQty() {
    qty++;
    update();
  }

  decQty() {
    if (qty == 1) return;
    qty--;
    update();
  }

  addToCart() async {
    var product = view.item.copyWith(
      qty: qty,
    );

    if (CartService.isExists(product)) {
      await showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Info'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('This item is already on your cart!'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              ),
            ],
          );
        },
      );
      return;
    }

    CartService.addItem(product);
    Get.back();

    CartController.instance.update();
  }
}
