import 'package:fireverse/fireglobal.dart';
import 'package:fireverse/firestore/models.dart';
import 'package:shelf/shelf.dart';

import '../../../lib/util/router_util.dart';

const Get = "Get";
const Post = "Post";
const Put = "Put";
const Delete = "Delete";

class ProductController {
  @Get
  index(Request req) async {
    var getRes = await Fire.get(
      collectionName: "events",
    );

    FireDartPage<FireDartDocument> list =
        (getRes as FireDartPage<FireDartDocument>);
    print(list.toList());
    var data = getRes[0];
    var eventName = data["title"];

    print(data);
    print(data["title"]);

    return jsonResponse({
      "data": {
        "product_name": "Deny",
        "data": eventName,
      }
    });
  }

  @Post
  create(req) async {}

  @Put
  update(req) async {}

  @Delete
  delete(req) async {}
}
