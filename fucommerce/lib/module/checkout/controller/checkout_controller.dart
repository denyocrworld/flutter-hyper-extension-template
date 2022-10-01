import 'package:fhe_template/core.dart';
import 'package:fhe_template/service/cart_service.dart';
import 'package:fhe_template/service/order_service.dart';
import 'package:fhe_template/service/voucher_service.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';

class CheckoutController extends State<CheckoutView> implements MvcController {
  static late CheckoutController instance;
  late CheckoutView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  double discount = 0;
  String voucherCode = "";

  updateDiscount(value) {
    voucherCode = value;
    var discountValue = VoucherService.voucherList[value];
    if (discountValue != null) {
      discount = discountValue;
    } else {
      discount = 0;
    }
    update();
  }

  saveOrder() async {
    await OrderService.addOrder(
      voucherCode: voucherCode,
      discount: discount,
      total: CartService.total,
      items: CartService.cartItems,
    );

    CartService.deleteAll();
    CartController.instance.update();
    Get.back();
  }
}
