import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args)async {
  final ip=InternetAddress.anyIPv4;
  //final ip="localhost";فس حال لم يشتغل(ipv4)
  final Prot =int.parse(Platform.environment['port'] ?? '8080');
  final router =Router()
  ..get('/home', (Request req){
  return Response.ok('grt1');
  })
  ..get('/settings', (Request req){
  return Response.ok('grt2 work');

  })
  ..get('/about', (Request req){
  return Response.ok('get3 work form API');

  });
  final server = await serve(router,ip,Prot);
  print("Server datring at http://${server.address.host}:${server.port}");


}