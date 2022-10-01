import 'package:fhe_template/core.dart';
import 'package:fhe_template/service/cart_service.dart';
import 'package:fhe_template/state_util.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controller/cart_controller.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  Widget build(context, CartController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              icon: const Icon(MdiIcons.delete),
              label: const Text("Delete all"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () => controller.deleteAll(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90.0,
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(64.0),
            ),
          ),
          onPressed: () => Get.to(const CheckoutView()),
          child: const Text("Checkout"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //body
              ListView.builder(
                itemCount: CartService.cartItems.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var product = CartService.cartItems[index];

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                          product.photo ??
                              "https://i.ibb.co/S32HNjD/no-image.jpg",
                        ),
                      ),
                      title: Text(product.productName!),
                      subtitle: Text("\$${product.price}"),
                      trailing: SizedBox(
                        width: 120.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => controller.decQty(product),
                              child: Card(
                                color: Colors.grey[800],
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "${product.qty}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => controller.addQty(product),
                              child: Card(
                                color: Colors.grey[800],
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<CartView> createState() => CartController();
}
