import 'package:fhe_template/model/product/seller.dart';
import 'package:fhe_template/service/product_service.dart';
import 'package:fhe_template/shared/util/input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../../../model/product/product.dart';
import '../view/product_form_view.dart';

class ProductFormController extends State<ProductFormView>
    implements MvcController {
  static late ProductFormController instance;
  late ProductFormView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doSave() async {
    bool isCreateMode = view.product == null;

    var productName = Input.get("product_name");
    var photo = Input.get("photo");
    var price = Input.get("price");
    var description = Input.get("description");

    if (isCreateMode) {
      await ProductService.addProduct(Product(
        productName: productName,
        photo: photo,
        price: double.parse(price),
        description: description,
        seller: Seller(
          uid: FirebaseAuth.instance.currentUser!.uid,
          sellerName: FirebaseAuth.instance.currentUser!.displayName,
        ),
      ));
    } else {
      debugPrint("productId: ${view.product?.id}");
      await ProductService.updateProduct(Product(
        id: view.product?.id,
        productName: productName,
        photo: photo,
        price: double.parse(price),
        description: description,
        seller: Seller(
          uid: FirebaseAuth.instance.currentUser!.uid,
          sellerName: FirebaseAuth.instance.currentUser!.displayName,
        ),
      ));
    }

    Get.back();
  }
}
