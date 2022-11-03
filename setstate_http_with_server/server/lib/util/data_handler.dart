import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:monalisa/env.dart';
import 'package:monalisa/util/router_util.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_multipart/form_data.dart';

import 'package:uuid/uuid.dart';

class DataHandler {
  static handlePost(Request req) async {
    Map postData = {};
    if (req.isMultipartForm) {
      await for (var data in req.multipartFormData) {
        if (data.filename != null) {
          var fileName = data.filename;
          var generatedFileName =
              "${Uuid().v4()}_$fileName".toLowerCase().replaceAll(" ", "_");

          var str = await data.part.readBytes();
          var bytes = str.lengthInBytes;
          final kb = bytes / 1024;
          final mb = kb / 1024;

          log("test");

          if (mb > Env.maximumUploadSizeInMB) {
            return jsonResponse({
              "error": true,
              "message": "Maximum file upload is ${Env.maximumUploadSizeInMB}",
            });
          }
          log("done");
          log("set postData[${data.name}]");

          postData[data.name] = {
            "name": data.name,
            "filename": data.filename,
            "url": "${Env.baseUrl}upload/$generatedFileName",
            "size": bytes,
            "size_in_kb": kb,
            "size_in_mb": mb,
            "generated_filename": generatedFileName,
            "content-type": data.part.headers["content-type"],
          };
          tempByteList["${req.hashCode.toString()}_${data.name}"] = str;
        } else {
          print("non file");
          // print(req.hashCode);
          // final payload = await req.readAsString();
          // postData = jsonDecode(payload);
          // postDataList[req.hashCode.toString()] = postData;
          postData[data.name] = await data.part.readString();
        }
      }
    } else {
      print("ISN'T MULTI{PART!!!");
      print(req.hashCode);
      final payload = await req.readAsString();
      postData = jsonDecode(payload);
    }

    postDataList[req.hashCode.toString()] = postData;
  }
}

Map<String, dynamic> postDataList = {};
Map<String, Uint8List> tempByteList = {};

extension RequestExtension on Request {
  Map<String, dynamic> post() {
    var value = postDataList[hashCode.toString()];
    postDataList.remove(hashCode.toString());
    return value;
  }

  Map<String, String> params() {
    var params = this.url.queryParameters;
    return params;
  }
}

extension FileExtension on dynamic {
  save(req) {
    // {
    //   "name": data.name,
    //   "filename": data.filename,
    //   "size": bytes,
    //   "size_in_kb": kb,
    //   "size_in_mb": mb,
    //   "generated_filename": generatedFileName,
    //   "content-type": data.part.headers["content-type"],
    // }

    var name = this["name"];
    var str = tempByteList["${req.hashCode.toString()}_$name"];
    var fileName = this["generated_filename"];
    var fullFileName = "${Env.uploadDir}$fileName";
    print("Saved to $fullFileName");
    File(fullFileName).writeAsBytesSync(str!);
  }
}
