import "package:dio/dio.dart";

class AddressService {
  static Future getAddresses({
    int page = 1,
    String search = "",
  }) async {
    var response = await Dio().get(
      "http://localhost:8000/api/addresses?page=$page&address_name=$search",
    );
    Map obj = (response.data as Map);
    return Future.value(obj);
  }
}
