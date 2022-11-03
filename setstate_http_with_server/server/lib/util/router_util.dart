import 'dart:convert';

import 'package:shelf/shelf.dart';

jsonResponse(value) {
  return Response.ok(
    jsonEncode(value),
    headers: {
      'Cache-Control': 'public, max-age=604800, immutable',
      'Content-Type': 'application/json'
    },
  );
}
