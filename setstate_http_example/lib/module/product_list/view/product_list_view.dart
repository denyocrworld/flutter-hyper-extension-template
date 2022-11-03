import 'package:dio/dio.dart';
import 'package:fhe_template/core.dart';
import 'package:fhe_template/shared/util/show_confirmation_dialog/show_confirmation_dialog.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  Widget build(context, ProductListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductList"),
        actions: const [],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => controller.openProductCreateForm(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //body

            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: null,
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                      decoration: InputDecoration.collapsed(
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: "What are you craving?",
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        hoverColor: Colors.transparent,
                      ),
                      onFieldSubmitted: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: FutureBuilder(
                future: Dio().get(
                  "http://localhost:8080/dynamic-api/products?limit=10",
                  options: Options(
                    contentType: "application/json",
                  ),
                ),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) return Container();
                  Response response = snapshot.data;
                  Map obj = response.data;
                  List items = obj["data"];
                  return ListView.builder(
                    itemCount: items.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = items[index];

                      //alt+shift+d
                      return InkWell(
                        onTap: () => controller.openProductEditForm(item),
                        child: Dismissible(
                          key: UniqueKey(),
                          onDismissed: (detail) {},
                          confirmDismiss: (direction) async {
                            bool confirm = await showConfirmationDialog();
                            if (confirm) {
                              await controller.deleteProduct(item["id"]);
                              return Future.value(true);
                            }
                            return Future.value(false);
                          },
                          child: Card(
                            child: ListTile(
                              title: Text("${item["name"]}"),
                              subtitle: Text("${item["price"]}"),
                            ),
                          ),
                        ),
                      );
                    },
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
