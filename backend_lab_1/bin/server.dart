import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;

  final int port = int.parse(Platform.environment['PORT'] ?? '8080');

  final router = Router()
    ..get('/home', (Request req) {
      return Response.ok("This is HOME page");
    })
    ..get('/settings', (Request req) {
      return Response.ok("This is SETTINGS page");
    })
    ..get('/about', (Request req) {
      return Response.ok("This is ABOUT page");
    });

  final server = await serve(router, ip, port);

  print("server is listening at http://${server.address.host}:${server.port}");
}
