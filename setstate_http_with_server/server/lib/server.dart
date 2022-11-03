






import 'package:monalisa/module/router_generator/route_generator.dart';
import 'package:path/path.dart' as path;

import 'package:shelf/shelf.dart';

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';



void main() async {
  // await DB.connect();
  var app = Router();

  await RouteGenerator.generate(app);

  var handler = createStaticHandler('public', defaultDocument: 'index.html');
  final cascade = Cascade().add(handler).add(app);
  int port = 8080;
  // String host = "0.0.0.0";
  String host = "localhost";

  await io.serve(
    logRequests().addHandler(cascade.handler),
    host,
    port,
  );

  print("------------------------");
  print("Running on $host:$port");
  print("------------------------");
}
