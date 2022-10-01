import "package:dio/dio.dart";

class ProductService {
  static Future getProducts({
    int page = 1,
    String search = "",
  }) async {
    var response = await Dio().get(
      "http://localhost:8000/api/products?page=$page&product_name=$search",
    );
    Map obj = (response.data as Map);
    return Future.value(obj);
  }
}
