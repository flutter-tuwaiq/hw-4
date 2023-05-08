import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';


void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;
  // final ip="localhost";

  final int port = int.parse(Platform.environment["Port"]?? '8080');

  // Configure routes.
final router = Router()
//..post('/homepage', (Request req){
  //return Response.ok("shuruq alharthi");
//})
..get('/home', (Request req){
  return Response.ok("the home page of the homework");
})

..get('/settings', (Request req){
  return Response.ok("its working!");
})

..get('/about', (Request req){
  return Response.ok("shuruq API backend homework");
});
  final server = await serve(router, ip, port);
  print('Server listening on port http://${server.address.host}: ${server.port}');
}
