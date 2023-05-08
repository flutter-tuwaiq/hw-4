import 'dart:io';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';


void main(List<String> args) async{

  final ip = InternetAddress.anyIPv4;

  final int prot = int.parse(Platform.environment["PORT"] ?? "8080");

  final router = Router()
  ..get("/House", (Request req){
      return Response.ok("Villa");
  })
  ..get("/Sttings", (Request req){
      return Response.ok("Stting");
  })
  ..get("/About", (Request req){
      return Response.ok("Home price");
  });

  final server = await serve(router , ip , prot );

  print("Server is Starting at http://${server.address.host}:${server.port}");


}