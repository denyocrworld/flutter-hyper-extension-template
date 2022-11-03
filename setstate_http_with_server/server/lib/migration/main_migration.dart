import 'package:monalisa/util/db.dart';

class MainMigration {
  static migrate() async {
    //Migrations
    DB.table("product").dropIfExists();
    DB.table("product").define({
      "id": "integer:primary",
      "product_name": "text",
      "description": "text",
      "memo": "text",
    });

    DB.table("customer").dropIfExists();
    DB.table("customer").define({
      "id": "integer:primary",
      "customer_name": "text",
      "address": "text",
      "address_detail": "text",
      "price": "double",
    });

    DB.table("customer").insert({
      "customer_name": "Deny",
      "address": "test",
      "address_detail": "detai",
      "price": 25.0
    });
  }
}
