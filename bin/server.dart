import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;

  final int port = int.parse(Platform.environment["PORT"] ?? "8080");

  final router = Router()
    ..get('/home', (Request req) {
      return Response.ok('Endpoint #1');
    })
    ..get('/settings', (Request req) {
      return Response.ok('Endpoint #2');
    })
    ..get('/about', (Request req) {
      return Response.ok('Endpoint #3');
    });

  final server = await serve(router, ip, port);
  print('Server is starting at http://${server.address.host}:${server.port}');
}
