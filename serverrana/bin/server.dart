import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main() async {
  final ip = InternetAddress.anyIPv4;

  final port = int.parse(Platform.environment["PORT"] ?? "8080");

  final router = Router()
    ..get('/home', (Request req) {
      return Response.ok('Home');
    })
    ..get('/about', (Request req) {
      return Response.ok('About page');
    })
    ..get('/settings', (Request req) {
      return Response.ok('Settings page');
    });

  final server = await serve(router, ip, port);
  print("serverv is dtarting at http://${server.address.host}:${server.port}");
}
