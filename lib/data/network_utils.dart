import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/data/auth_util.dart';
import 'package:flutter_task_manager/main.dart';
import 'package:flutter_task_manager/ui/screen/login.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  //get request
  Future<dynamic> getMethod(String url, {VoidCallback? onUnAuthorize}) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          moveToLogin();
        }
      } else {
        log('Something went wrong');
      }
    } catch (e) {
      log('Error $e');
    }
  }

  //post request
  Future<dynamic> postMethod(String url, {Map<String,
      String>?body, VoidCallback? onUnAuthorize, String? token}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'application/json',
            'token': token ?? ''
          },
          body: jsonEncode(body));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          moveToLogin();
        }
      } else {
        log('Something went wrong ${response.statusCode}');
      }
    } catch (e) {
      log('Error $e');
    }
  }

  void moveToLogin() async{
    await AuthUtils.clearData();
    Navigator.pushAndRemoveUntil(
        MyApp.globalKey.currentContext!, MaterialPageRoute(builder: (context) => LoginScreen()), (
        route) => false);
  }

}
