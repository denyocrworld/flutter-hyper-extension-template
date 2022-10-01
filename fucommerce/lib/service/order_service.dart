/*
orders
  uid 
    created_at
    customer  
      uid
      customer_name
    voucher_code
    discount
    total
    items
      --
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/model/product/product.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderService {
  static addOrder({
    required String voucherCode,
    required double discount,
    required double total,
    required List<Product> items,
  }) async {
    var productList = [];

    for (var i = 0; i < items.length; i++) {
      var product = items[i];
      productList.add({
        "product_name": product.productName,
        "price": product.price,
        "photo": product.photo,
        "description": product.description,
        "seller": {
          "uid": product.seller!.uid,
          "seller_name": product.seller!.sellerName,
        },
      });
    }
    await FirebaseFirestore.instance.collection("orders").add({
      "created_at": Timestamp.now(),
      "customer": {
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "customer_name": FirebaseAuth.instance.currentUser!.displayName ?? "-",
      },
      "voucher_code": voucherCode,
      "discount": discount,
      "total": total,
      "items": productList,
    });
  }
}
