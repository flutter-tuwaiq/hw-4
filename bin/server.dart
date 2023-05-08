import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {

  final  ip = InternetAddress.anyIPv4;

  final port = int.parse(Platform.environment['PORT'] ?? '8080'); 

  final router = Router() 
  ..get('/homepage', (Request req){
    return Response.ok("Home Page");
  }) ..get('/settings', (Request req){
    return Response.ok("Settings...");
  }) ..get('/about', (Request req){
    return Response.ok("About...");
  });

  final server = await serve(router,ip,port);
  print("server is starting at http://${server.address.host}:${server.port}");
}

