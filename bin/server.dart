import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;
  final rawter = Router()
    ..get("/home", (Request req) {
      return Response.ok("home is ok");
    })
    ..get("/seting", (Request req) {
      return Response.ok("seting is ok");
    })
    ..get("/login", (Request req) {
      return Response.ok("login is ok");
    });
  final handler = Pipeline().addMiddleware((innerHandler) => rawter);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final servar = await serve(rawter, ip, port);
  print("verfve   //http://${servar.address.host}:${servar.port}");
}
