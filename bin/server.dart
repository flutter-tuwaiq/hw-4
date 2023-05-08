import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

Future<void> main(List<String> args) async {
  
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment["PORT"] ?? '8080');
  final router =  Router()
  ..get("/Home", (Request request){
      return Response.ok('Welcome To Home Page');
  })
  ..get("/settings", (Request request){
      return Response.ok('Welcome To settings Page');
  })
  ..get('/about', (Request request){
      return Response.ok('Welcome To about Page');
  });
  final server = await serve(router, ip, port);

  print("Server is Http:/${server.address.host}:${server.port}");

}