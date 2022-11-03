import 'package:flutter/material.dart';
import '../controller/product_form_controller.dart';

class ProductFormView extends StatefulWidget {
  final Map? item;
  const ProductFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, ProductFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: TextFormField(
                initialValue: item?["name"],
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "Your product name",
                ),
                onChanged: (value) {
                  controller.productName = value;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: TextFormField(
                initialValue: item?["price"]?.toString(),
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "Your product price",
                ),
                onChanged: (value) {
                  controller.price = double.parse(value);
                },
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40.0,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: Text(controller.isEditMode ? "Update" : "Save"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      controller.isEditMode ? Colors.orange : Colors.green,
                ),
                onPressed: () => controller.save(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<ProductFormView> createState() => ProductFormController();
}
