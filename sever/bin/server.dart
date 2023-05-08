import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
void main(List<String> args)async {
  final ip=InternetAddress.anyIPv4;
  //هذااي بي  الجهاز
  final port =int.parse(Platform.environment["port"]??'8080');
  final router =Router()
  ..post("/homepage",(Request req){return Response.ok('sttrjg');})
  ..get('/hompage',(Request req){
return Response.ok('hom page');

  });
  final  server  = await serve(router,ip,port);
print('server is at http://${server.address.host}:${server.port}');
}