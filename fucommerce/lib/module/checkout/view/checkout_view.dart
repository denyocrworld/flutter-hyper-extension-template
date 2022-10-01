import 'package:fhe_template/service/cart_service.dart';
import 'package:flutter/material.dart';
import '../controller/checkout_controller.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  Widget build(context, CheckoutController controller) {
    controller.view = this;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Checkout"),
        actions: const [],
      ),
      bottomNavigationBar: SizedBox(
        child: Wrap(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: const Text(
                              "Discount",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            subtitle: Text(
                              "\$${controller.discount}",
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: '',
                            maxLength: 10,
                            decoration: const InputDecoration(
                              labelText: 'Your voucher code',
                              labelStyle: TextStyle(
                                color: Colors.blueGrey,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            onFieldSubmitted: (value) =>
                                controller.updateDiscount(value),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text("Total"),
                    subtitle: Row(
                      children: [
                        Text(
                          "\$${CartService.total}",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            decoration: controller.discount > 0
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        if (controller.discount > 0)
                          Text(
                            "\$${(CartService.total - controller.discount)}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                      ],
                    ),
                    trailing: ElevatedButton.icon(
                      icon: const Icon(Icons.check),
                      label: const Text("Submit"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () => controller.saveOrder(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: CartService.cartItems.length,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var product = CartService.cartItems[index];
                  double total = product.qty! * product.price!;
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
                      subtitle: Text("${product.qty} x ${product.price}"),
                      trailing: SizedBox(
                        width: 120.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "$total",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
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
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<CheckoutView> createState() => CheckoutController();
}
