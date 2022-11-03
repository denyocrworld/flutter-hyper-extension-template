import 'dart:io';

import 'package:monalisa/env.dart';
import 'package:monalisa/util/data_handler.dart';
import 'package:monalisa/util/express_controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_multipart/form_data.dart';
import '../../util/metadata.dart';
import '../../util/router_util.dart';

class ProductController extends ExpressController {
  createInstance() => ProductController();

  @GET
  index(Request req) async {
    return jsonResponse({
      "data": {
        "product_name": "Deny 1",
        "data": "test",
      }
    });
  }

  @GET
  single(Request req, id) async {
    return jsonResponse({
      "data": {
        "product_name": "api with parameter $id",
        "data": "test",
      }
    });
  }

  @POST
  create(Request req) async {
    return jsonResponse({
      "message": "Data is created!",
      "data": req.post(),
    });
  }

  @PUT
  update(Request req, int id) async {
    return jsonResponse({
      "message": "Data is updated!",
      "data": req.post(),
    });
  }

  @DELETE
  delete(Request req, int id) async {
    if (req.isMultipartForm) {
      await for (var data in req.multipartFormData) {
        print(data.filename);
        var fileName = data.filename;
        var str = await data.part.readBytes();
        File("${Env.uploadDir}$fileName").writeAsBytesSync(str);
      }
    }

    return jsonResponse({
      "message": "Data is deleted!",
      "data": req.post(),
    });
  }

  @POST
  upload(Request req) async {
    var post = req.post();
    Map file = post["file"];
    print(file);
    file.save(req);

    return jsonResponse({
      "message": "Data is uploaded!",
      "post": post,
      "data": {
        "url": post["file"]["url"],
      },
    });
  }

  @POST
  generateDummy(Request req) async {
    // var post = req.post();
    return jsonResponse({
      "message": "Dummy data is generated!",
      // "post": post,
    });
  }

  @POST
  customActionWithParam(Request req, int id) async {
    // var post = req.post();
    return jsonResponse({
      "message": "customActionWithParam: $id",
      // "post": post,
    });
  }
}
