import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fluttertutorial2/data/models/http_package.dart';
import 'package:http/http.dart' as http;

class HttpPackageApi {
  static Future<HttpPackage?> getCall() async {
    final uri = Uri.parse("https://dart.dev/f/packages/http.json");
    try {
      var response = await http.get(uri);
      return HttpPackage.fromJson(response.body);
    } on SocketException catch (e) {
      print(e);
      throw ('Please check your connection.');
    } catch (e) {
      inspect('error : $e');
      return null;
    }
  }
}
