import 'package:fhe_template/model/product/product.dart';

class CartService {
  static List<Product> cartItems = [];

  static addItem(Product product) {
    cartItems.add(product);
  }

  static removeItem(Product product) {
    cartItems.removeWhere((p) => p.id == product.id);
  }

  static addQty(Product product) {
    var newProductUpdate = product.copyWith(
      qty: product.qty! + 1,
    );

    var index = cartItems.indexWhere((p) => p.id == product.id);
    cartItems[index] = newProductUpdate;
  }

  static decQty(Product product) {
    if (product.qty == 1) {
      cartItems.removeWhere((p) => p.id == product.id);
      return;
    }

    var newProductUpdate = product.copyWith(
      qty: product.qty! - 1,
    );

    var index = cartItems.indexWhere((p) => p.id == product.id);
    cartItems[index] = newProductUpdate;
  }

  static deleteAll() {
    cartItems.clear();
  }

  static isExists(Product product) {
    return cartItems.where((p) => p.id == product.id).toList().isNotEmpty;
  }

  static get total {
    double total = 0;
    for (var product in cartItems) {
      total += product.qty! * product.price!;
    }
    return total;
  }
}
