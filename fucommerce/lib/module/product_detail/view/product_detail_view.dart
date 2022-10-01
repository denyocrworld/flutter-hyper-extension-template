import 'package:fhe_template/model/product/product.dart';
import 'package:fhe_template/service/product_service.dart';
import 'package:flutter/material.dart';
import '../controller/product_detail_controller.dart';

class ProductDetailView extends StatefulWidget {
  final Product item;
  const ProductDetailView({
    Key? key,
    required this.item,
  }) : super(key: key);

  Widget build(context, ProductDetailController controller) {
    controller.view = this;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 16.0,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 16.0,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90.0,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "\$${item.price}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                onPressed: () => controller.addToCart(),
                child: const Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //body
            Container(
              height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    item.photo ?? "https://i.ibb.co/S32HNjD/no-image.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.productName ?? "",
                              style: const TextStyle(
                                fontSize: 16.0,
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
                                  item.seller?.sellerName ?? "-",
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange[600],
                        size: 18.0,
                      ),
                      const Text(
                        "4.9",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    item.description ?? "-",
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 80.0,
                    child: ListView.builder(
                      // itemCount: item.galleries?.length,
                      itemCount: ProductService.photoGalleryDummies.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        // var imageGallery = item.galleries[index];
                        var imageGallery =
                            ProductService.photoGalleryDummies[index];

                        return Container(
                          height: 80.0,
                          width: 80.0,
                          margin: const EdgeInsets.only(
                            right: 10.0,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                imageGallery,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => controller.decQty(),
                          child: const Card(
                            child: Icon(
                              Icons.remove,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "${controller.qty}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.addQty(),
                          child: const Card(
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<ProductDetailView> createState() => ProductDetailController();
}
