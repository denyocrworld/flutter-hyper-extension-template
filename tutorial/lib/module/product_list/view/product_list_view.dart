import 'package:fhe_template/service/address_service.dart';
import 'package:fhe_template/shared/widget/list/list.dart';
import 'package:flutter/material.dart';
import '../../../model/address/address.dart';
import '../controller/product_list_controller.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  Widget build(context, ProductListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[400]!,
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: null,
                      decoration: const InputDecoration.collapsed(
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: "Search",
                      ),
                      onFieldSubmitted: (value) {
                        controller.updateSearch(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: QListView(
            //     id: "product_list",
            //     getFuture: (page, query) async {
            //       return await ProductService.getProducts(
            //         page: page,
            //         search: query["search"],
            //       );
            //     },
            //     itemBuilder: (item, index) {
            //       var product = Product.fromJson(item);
            //       return Card(
            //         child: ListTile(
            //           leading: CircleAvatar(
            //             backgroundColor: Colors.grey[200],
            //             backgroundImage: NetworkImage(
            //               item["photo"] ??
            //                   "https://i.ibb.co/S32HNjD/no-image.jpg",
            //             ),
            //           ),
            //           title: Text("${product.productName}"),
            //           subtitle: Text("${product.price}"),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Expanded(
              child: QListView(
                id: "customer_list",
                getFuture: (page, query) async {
                  return await AddressService.getAddresses(
                    page: page,
                    search: query["search"] ?? "",
                  );
                },
                itemBuilder: (item, index) {
                  var address = Address.fromJson(item);
                  return Card(
                    child: ListTile(
                      title: Text("${address.addressName}"),
                      subtitle: Text("${address.addressDetail}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<ProductListView> createState() => ProductListController();
}
