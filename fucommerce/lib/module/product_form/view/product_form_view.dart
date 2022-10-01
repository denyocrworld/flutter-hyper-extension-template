import 'package:fhe_template/model/product/product.dart';
import 'package:fhe_template/shared/widget/image_picker/image_picker.dart';
import 'package:fhe_template/shared/widget/textfield/numberfield.dart';
import 'package:fhe_template/shared/widget/textfield/textarea.dart';
import 'package:fhe_template/shared/widget/textfield/textfield.dart';
import 'package:flutter/material.dart';
import '../controller/product_form_controller.dart';

class ProductFormView extends StatefulWidget {
  final Product? product;
  const ProductFormView({
    Key? key,
    this.product,
  }) : super(key: key);

  Widget build(context, ProductFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Form"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("Save"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () => controller.doSave(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QImagePicker(
                id: "photo",
                label: "Photo",
                onChanged: (value) {},
                value: product != null ? product!.photo : null,
              ),
              QTextField(
                id: "product_name",
                label: "Product Name",
                helperText: "Your product name",
                onChanged: (value) {},
                value: product != null ? product!.productName : null,
              ),
              QNumberField(
                id: "price",
                label: "Price",
                helperText: "Your product price",
                onChanged: (value) {},
                value: product != null ? product!.price.toString() : null,
              ),
              QTextArea(
                id: "description",
                label: "Description",
                helperText: "Your product description",
                onChanged: (value) {},
                value: product != null ? product!.description : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProductFormView> createState() => ProductFormController();
}
