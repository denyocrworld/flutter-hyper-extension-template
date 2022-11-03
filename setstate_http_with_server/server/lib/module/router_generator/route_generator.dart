import 'dart:async';

import 'package:monalisa/core.dart';

import 'package:monalisa/util/data_handler.dart';

import 'package:monalisa/util/express_controller.dart';

import 'package:monalisa/util/string_util.dart';

import 'package:shelf/shelf.dart';

import 'package:shelf_router/shelf_router.dart';

import 'dart:mirrors';

class RouteGenerator {
  static generate(Router app) async {
    var c = DynamicApiController();
    var instanceMirrorList = findSubClasses(ExpressController());
    print("done: ${instanceMirrorList.length}");
    for (var i = 0; i < instanceMirrorList.length; i++) {
      var im = instanceMirrorList[i];
      print("im: im");
      generateRoute(app, im);
    }

    var endpoint = "/dynamic-api/<module>";
    app.get(endpoint, (Request request, String module) async {
      print(request.hashCode);
      // var r = await DataHandler.handlePost(request);
      // if (r != null) return r;
      return await DynamicApiController().indexDynamic(request, module);
    });

    app.post(endpoint, (Request request, String module) async {
      print(request.hashCode);
      var r = await DataHandler.handlePost(request);
      if (r != null) return r;
      return await DynamicApiController().createDynamic(request, module);
    });

    app.post("$endpoint/<id>",
        (Request request, String module, String idParam) async {
      var id = int.parse(idParam);
      var r = await DataHandler.handlePost(request);
      if (r != null) return r;
      return await DynamicApiController().updateDynamic(request, module, id);
    });

    app.delete("$endpoint/<id>",
        (Request request, String module, String idParam) async {
      var id = int.parse(idParam);
      print(request.hashCode);
      return await DynamicApiController().deleteDynamic(request, module, id);
    });

    app.delete("$endpoint/action/delete-all",
        (Request request, String module) async {
      print(request.hashCode);
      return await DynamicApiController().deleteAllDynamic(request, module);
    });

    app.get("$endpoint/action/count", (Request request, String module) async {
      print(request.hashCode);
      return await DynamicApiController().countAllDynamic(request, module);
    });
  }

  static generateRoute(Router app, instance) {
    InstanceMirror im = reflect(instance);
    ClassMirror classMirror = im.type;
    var className =
        im.reflectee.runtimeType.toString().replaceAll("Controller", "").trim();
    var endpointName = className.toRouterCase();
    print("generateRoutes....${classMirror.declarations.length}");
    classMirror.declarations.forEach((Symbol s, DeclarationMirror mirror) {
      if (mirror is MethodMirror == false) return;
      var methodMirror = (mirror as MethodMirror);
      var parameters = methodMirror.parameters;
      if (methodMirror.metadata.isNotEmpty) {
        String? functionName =
            s.toString().replaceAll('Symbol("', '').replaceAll('")', '');
        String? titleCase = functionName.toTitleCase();
        String? annotation = methodMirror.metadata.first.reflectee;
        String? routerCase = functionName.toRouterCase();
        String? camelCase = functionName.toCamelCase();
        //
        var idParameter = "<id|[0-9]+>";
        String getEndpoint() {
          var endpoint = "/api/$endpointName";
          if (parameters.length >= 2) {
            endpoint += "/$idParameter";
          }
          return endpoint;
        }

        if (functionName == "index" && annotation == "GET") {
          var endpoint = getEndpoint();
          print("GET Endpoint: $endpoint");
          app.get(endpoint, (Request request) async {
            return await im.callAsync(functionName, [request]);
          });
        }
        if (functionName == "single" && annotation == "GET") {
          var endpoint = getEndpoint();
          print("GET Endpoint: $endpoint");
          app.get(endpoint, (Request request, String idString) async {
            var id = int.parse(idString);
            return await im.callAsync(functionName, [request, id]);
          });
        } else if (functionName == "create" && annotation == "POST") {
          var endpoint = getEndpoint();
          print("POST Endpoint: $endpoint");
          app.post(endpoint, (Request request) async {
            var r = await DataHandler.handlePost(request);
            if (r != null) return r;
            return await im.callAsync(functionName, [request]);
          });
        } else if (functionName == "update" && annotation == "PUT") {
          var endpoint = getEndpoint();
          print("PUT Endpoint: $endpoint");
          app.put(endpoint, (Request request, String idString) async {
            int id = int.parse(idString);
            var r = await DataHandler.handlePost(request);
            if (r != null) return r;
            return await im.callAsync(functionName, [request, id]);
          });
        } else if (functionName == "delete" && annotation == "DELETE") {
          var endpoint = getEndpoint();
          print("DELETE Endpoint: $endpoint");
          app.delete(endpoint, (Request request, String idString) async {
            int id = int.parse(idString);
            var r = await DataHandler.handlePost(request);
            if (r != null) return r;
            return await im.callAsync(functionName, [request, id]);
          });
        } else {
          if (parameters.length == 1) {
            var endpoint = "/api/$endpointName/action/$routerCase";
            print("POST Endpoint: $endpoint");
            app.post(endpoint, (Request request) async {
              print(request.hashCode);
              var r = await DataHandler.handlePost(request);
              if (r != null) return r;
              return await im.callAsync(functionName, [request]);
            });
          } else {
            var endpoint = "/api/$endpointName/action/$routerCase/$idParameter";
            print("POST Endpoint: $endpoint");
            app.post(endpoint, (Request request, String idString) async {
              int id = int.parse(idString);
              print(request.hashCode);
              var r = await DataHandler.handlePost(request);
              if (r != null) return r;
              return await im.callAsync(functionName, [request, id]);
            });
          }
        }
      }
    });
  }
}

extension InstanceMirrorExtension on InstanceMirror {
  callAsync(String methodName, List arguments) async {
    var im = this;
    var result = im.invoke(Symbol(methodName), arguments);
    var resultValue = await (result.reflectee as Future);
    return resultValue;
  }

  call(String methodName, List arguments) {
    var im = this;
    var result = im.invoke(Symbol(methodName), arguments);
    var resultValue = result.reflectee;
    return resultValue;
  }
}

List findSubClasses(type) {
  List imList = [];
  ClassMirror classMirror = reflectClass(type.runtimeType);
  var l = currentMirrorSystem()
      .libraries
      .values
      .expand((lib) => lib.declarations.values)
      .where((lib) {
    if (lib is ClassMirror) {
      if (lib.toString().contains("Controller") &&
          !lib.toString().contains("_") &&
          lib.isSubclassOf(classMirror)) {
        print("$lib : ${lib.metadata.length}");
        InstanceMirror m = lib.newInstance(Symbol(''), []);
        imList.add(m);
      }
    }
    return lib is ClassMirror &&
        lib.isSubclassOf(classMirror) &&
        lib != classMirror;
  }).toList();
  for (var i = 0; i < imList.length; i++) {
    var im = (imList[i] as InstanceMirror);
    bool isExpressController = im.type.toString().contains("ExpressController");
    if (!isExpressController) {
      var instance = im.call("createInstance", []);
      imList[i] = instance;
    }
  }
  return imList;
}
