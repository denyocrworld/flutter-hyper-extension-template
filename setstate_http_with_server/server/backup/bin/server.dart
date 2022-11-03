// Copyright (c) 2021, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:shelf_static/shelf_static.dart' as shelf_static;

import 'controller/product_controller.dart';
import 'package:fireverse/fireglobal.dart';

Future<void> main() async {
  print("Connecting...");
  // await DB.connect();
  if (1 == 3) {
    await Fire.initialize(
      apiKey: "AIzaSyDHox6bgNiPLrPZaYj6zFwEBUvmhC8ikAk",
      projectId: "capekngoding-website",
      appId: "1:845116064246:web:98981897178eb624d447d7",
      messagingSenderId: "845116064246",
    );
    await Fire.signInAnonymously();
  }

  // TypeMirror typeOfA = reflectType(ProductController);
  // List<InstanceMirror> metadatas = typeOfA.metadata;
  // for (InstanceMirror m in metadatas) {
  //   ClassMirror cm = m.type;
  //   // here you get the Class of the annotation
  //   print("cm: ${cm.metadata}");
  // }

  InstanceMirror im = reflect(ProductController());
  ClassMirror classMirror = im.type;
  print(classMirror.declarations.values.first.simpleName);
  print(classMirror.declarations.values.first.qualifiedName);
  print(classMirror.declarations.values.first.metadata);
  print(classMirror.declarations.values.first.metadata);
  classMirror.declarations.forEach((Symbol s, DeclarationMirror mirror) {
    if (mirror.metadata.isNotEmpty) {
      print(
        'Symbol $s has MetaData: "${mirror.metadata.first.reflectee}"',
      );

      String? functionName =
          s.toString().replaceAll('Symbol("', '').replaceAll('")', '');
      String? annotation = mirror.metadata.first.reflectee;

      print("functionNanme: $functionName");
      print("annotation: $annotation");
      print(
        classMirror.declarations.values
            .whereType<MethodMirror>()
            .toList()
            .first
            .simpleName,
      );
      print("---");
    }
  });
  // for (var v in classMirror.declarations.values) {
  //   if (v is VariableMirror) {
  //     // Handle if data member is a variable
  //     print("Variable: $v");
  //   } else if (v is MethodMirror) {
  //     // Handle if data member is a method
  //     print("Method: $v");
  //   }
  // }

  print("Connected!");

  // If the "PORT" environment variable is set, listen to it. Otherwise, 8080.
  // https://cloud.google.com/run/docs/reference/container-contract#port
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  // See https://pub.dev/documentation/shelf/latest/shelf/Cascade-class.html
  final cascade = Cascade()
      // First, serve files from the 'public' directory
      .add(_staticHandler)
      // If a corresponding file is not found, send requests to a `Router`
      .add(router);

  // See https://pub.dev/documentation/shelf/latest/shelf_io/serve.html
  final server = await shelf_io.serve(
    // See https://pub.dev/documentation/shelf/latest/shelf/logRequests.html
    logRequests()
        // See https://pub.dev/documentation/shelf/latest/shelf/MiddlewareExtensions/addHandler.html
        .addHandler(cascade.handler),
    InternetAddress.anyIPv4, // Allows external connections
    port,
  );

  print('Serving at http://${server.address.host}:${server.port}');

  // Used for tracking uptime of the demo server.
  _watch.start();
}

// Serve files from the file system.
final _staticHandler =
    shelf_static.createStaticHandler('public', defaultDocument: 'index.html');

// Router instance to handler requests.
var rauter = shelf_router.Router();

final router = rauter
  ..get('/helloworld', _helloWorldHandler)
  ..get('/api/products', ProductController().index)
  ..post('/api/products', ProductController().create)
  ..put('/api/products', ProductController().update)
  ..delete('/api/products', ProductController().delete)
  ..get(
    '/time',
    (request) => Response.ok(DateTime.now().toUtc().toIso8601String()),
  )
  ..get('/info.json', _infoHandler)
  ..get('/sum/<a|[0-9]+>/<b|[0-9]+>', _sumHandler);

var d = router..get('/helloworld', _helloWorldHandler);

Response _helloWorldHandler(Request request) => Response.ok('Hello, World!');

String _jsonEncode(Object? data) =>
    const JsonEncoder.withIndent(' ').convert(data);

const _jsonHeaders = {
  'content-type': 'application/json',
};

Response _sumHandler(Request request, String a, String b) {
  final aNum = int.parse(a);
  final bNum = int.parse(b);
  return Response.ok(
    _jsonEncode({'a': aNum, 'b': bNum, 'sum': aNum + bNum}),
    headers: {
      ..._jsonHeaders,
      'Cache-Control': 'public, max-age=604800, immutable',
    },
  );
}

final _watch = Stopwatch();

int _requestCount = 0;

final _dartVersion = () {
  final version = Platform.version;
  return version.substring(0, version.indexOf(' '));
}();

Response _infoHandler(Request request) => Response(
      200,
      headers: {
        ..._jsonHeaders,
        'Cache-Control': 'no-store',
      },
      body: _jsonEncode(
        {
          'Dart version': _dartVersion,
          'uptime': _watch.elapsed.toString(),
          'requestCount': ++_requestCount,
        },
      ),
    );
