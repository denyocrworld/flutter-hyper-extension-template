import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:fhe_template/model/product/product.dart';
import 'package:fhe_template/service/product_category_service.dart';
import 'package:fhe_template/state_util.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DevHomeView()),
                );
              },
              child: const Text(
                "Fucommerce",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            const Text(
              "women ecommerce apps",
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
          ],
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //body
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 12.0,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
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
                              decoration: InputDecoration.collapsed(
                                filled: true,
                                fillColor: Colors.transparent,
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                              onFieldSubmitted: (value) =>
                                  controller.updateSearchValue(value),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.tune,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),

              SizedBox(
                height: 40.0,
                child: ListView.builder(
                  itemCount: ProductCategoryService.items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var item = ProductCategoryService.items[index];

                    var isSelected = item.productCategoryName ==
                        controller.selectedProductCategoryName;

                    var isAllSelected =
                        controller.selectedProductCategoryName == "All";

                    return Row(
                      children: [
                        if (index == 0) ...[
                          InkWell(
                            onTap: () {
                              controller.updateSelectedProductCategory("All");
                            },
                            child: Card(
                              color: isAllSelected
                                  ? Colors.grey[900]
                                  : Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Center(
                                  child: Text(
                                    "All",
                                    style: TextStyle(
                                      color:
                                          isAllSelected ? Colors.white : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        InkWell(
                          onTap: () {
                            controller.updateSelectedProductCategory(
                                item.productCategoryName);
                          },
                          child: Card(
                            color: isSelected ? Colors.grey[900] : Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Center(
                                child: Text(
                                  "${item.productCategoryName}",
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("products")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No Data");
                  }
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item = (snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>);
                      item["id"] = snapshot.data!.docs[index].id;
                      var product = Product.fromJson(item);

                      if (controller.search.isNotEmpty) {
                        var search = controller.search.toLowerCase();
                        var productName = product.productName!.toLowerCase();

                        if (!productName.contains(search)) {
                          return Container();
                        }
                      }
                      return InkWell(
                        onTap: () {
                          Get.to(ProductDetailView(
                            item: product,
                          ));
                        },
                        child: Card(
                          elevation: 0.8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 120.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        product.photo ??
                                            "https://i.ibb.co/S32HNjD/no-image.jpg",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        16.0,
                                      ),
                                    ),
                                  ),
                                  child: Stack(
                                    children: const [
                                      Positioned(
                                        right: 4,
                                        top: 4,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 12.0,
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.grey,
                                            size: 12.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.productName ?? "-",
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "by ",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                            ),
                                          ),
                                          Text(
                                            product.seller?.sellerName ?? "-",
                                            style: const TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        product.description ?? "-",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 11.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12.0,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${product.price}",
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder(),
                                            ),
                                            onPressed: () {},
                                            child: const Text("Buy"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
  State<DashboardView> createState() => DashboardController();
}
