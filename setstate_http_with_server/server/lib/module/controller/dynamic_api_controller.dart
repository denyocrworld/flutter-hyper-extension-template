import 'dart:io';

import 'package:monalisa/env.dart';
import 'package:monalisa/util/data_handler.dart';
import 'package:monalisa/util/express_controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_multipart/form_data.dart';

import '../../util/metadata.dart';
import '../../util/router_util.dart';

Map<String, List<Map<String, dynamic>>> collectionsMap = {};

class DynamicApiController extends ExpressController {
  createInstance() => DynamicApiController();

  @GET
  indexDynamic(Request req, String module) async {
    var params = req.params();
    var limit = int.tryParse(params["limit"].toString()) ?? 10;
    var page = int.tryParse(params["page"].toString()) ?? 1;
    String? orderBy = params["order-by"];
    String? sortType = params["sort-type"];
    List<Map<String, dynamic>>? dataList = collectionsMap[module] ?? [];

    if (dataList.isEmpty) {
      collectionsMap[module] = collectionsMap[module] ?? [];

      for (var i = 0; i < 20; i++) {
        collectionsMap[module]!.add(
          {
            "id": i + 1,
            "name": "ACC Sedap Mantap",
            "price": i + 1,
          },
        );
      }
    }

    if (orderBy != null) {
      if (sortType != "desc") {
        dataList.sort((a, b) => (a[orderBy] as dynamic).compareTo(b[orderBy]));
      } else {
        dataList.sort((a, b) => (b[orderBy] as dynamic).compareTo(a[orderBy]));
      }
    }

    // (1 * 10) - 10
    // (2 * 10) - 10
    var startIndex = (page * limit) - limit;
    dataList = dataList.sublist(startIndex);

    if (limit > 0) {
      dataList = dataList.take(limit).toList();
    }

    return jsonResponse({
      "module": module,
      "data": dataList,
      "data_count": collectionsMap[module]?.length ?? 0,
      "params": req.params(),
    });
  }

  @POST
  createDynamic(Request req, String module) async {
    var post = req.post();
    if (collectionsMap[module] == null) {
      collectionsMap[module] = [];
    }

    collectionsMap[module]!.sort((a, b) => a["id"].compareTo(b["id"]));
    var lastId = collectionsMap[module]!.length == 0
        ? 1
        : collectionsMap[module]!.last["id"] + 1;

    // post["id"] = Uuid().v4();
    post["id"] = lastId;
    collectionsMap[module]!.add(post);

    return jsonResponse({
      "module": module,
      "message": "Data is created!",
      "data": post,
    });
  }

  @POST
  updateDynamic(Request req, String module, int id) async {
    var post = req.post();
    if (collectionsMap[module] == null) {
      collectionsMap[module] = [];
    }

    List items = collectionsMap[module]!;
    var searchItems = items.where((i) => i["id"] == id).toList();
    if (searchItems.isEmpty) {
      return jsonResponse({
        "module": module,
        "message": "Data not found",
        "id": id,
        "searchItems": searchItems.length,
        "items": items.length,
        "data": {},
      });
    }

    var item = searchItems.first;
    var index = collectionsMap[module]!.indexOf(item);
    post["id"] = item["id"];
    collectionsMap[module]![index] = post;

    return jsonResponse({
      "module": module,
      "message": "Data is updated!",
      "id": id,
      "data": post,
    });
  }

  @DELETE
  deleteDynamic(Request req, String module, int id) async {
    if (collectionsMap[module] == null) {
      collectionsMap[module] = [];
    }

    var items = collectionsMap[module];
    items!.removeWhere((i) => i["id"] == id);

    return jsonResponse({
      "module": module,
      "message": "This data is deleted!",
      "id": id,
    });
  }

  @DELETE
  deleteAllDynamic(Request req, String module) async {
    collectionsMap[module] = [];

    return jsonResponse({
      "module": module,
      "message": "All data is deleted!",
    });
  }

  @GET
  countAllDynamic(Request req, String module) async {
    return jsonResponse({
      "module": module,
      "message": "All data is deleted!",
      "data_count": collectionsMap[module]?.length ?? 0,
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
