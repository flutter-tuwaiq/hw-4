import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {

  final ip = InternetAddress.anyIPv4;
  final int port = int.parse(Platform.environment['PORT'] ?? '8080');
final router = Router()
..get('/home', (Request req){
  return Response.ok("hello user");
})..get('/settings', (Request req){
  return Response.ok("You're in the Settings");
})..get('/about', (Request req){
  return Response.ok("about this website");
});
  // For running in containers, we respect the PORT environment variable.
  final server = await serve(router, ip, port);
  print('Server is starting at port http://${server.address.host}:${server.port}');

}