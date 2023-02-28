import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;

class NetworkUtils {
  //get request
  Future<dynamic> getMethod(String url, {VoidCallback? onUnAuthorize}) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if(onUnAuthorize != null){
          onUnAuthorize();
        }
      } else {
        print('Something went rong');
      }
    } catch (e) {
      print(e);
    }
  }

  //post request
  Future<dynamic> postMethod(String url, {Map<String, String>?body, VoidCallback? onUnAuthorize, String? token}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-type':'application/json',
            'token': token ?? ''
          },
          body: jsonEncode(body));
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if(onUnAuthorize != null){
          onUnAuthorize();
        }
      } else {
        print('Something went wrong ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

}
