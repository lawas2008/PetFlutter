import 'package:pet/utils/Constants.dart';
import 'package:http/http.dart' as http;

///http请求封装
class HttpController {
  ///get请求
  static void get(String url, Function callback,
      {Map<String, String> params, Function errorCallback}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String parmStr = sb.toString();
      parmStr = parmStr.substring(0, parmStr.length - 1);
      print("$Constants.BASE_URL+$url");
      url = Constants.BASE_URL + url + parmStr;
      print("$parmStr");
    }
    try {
      http.Response res = await http.get(url);
      if (callback != null) {
        String body=res.body;
        print("$body");
        callback(body);
      }
    } catch (exception) {
      if (errorCallback != null) {
        errorCallback(exception);
      }
    }
  }

  ///post请求
  static void post(String url, Function callback,
      {Map<String, String> params, Function errorCallback}) async {
    url = Constants.BASE_URL + url;
    print("$url");
    print("$params");
    try {
      http.Response res = await http.post(url, body: params);
      if (callback != null) {
        String body=res.body;
        print("$body");
        callback(body);
      }
    } catch (exception) {
      if (errorCallback != null) {
        print("$exception");
        errorCallback(exception);
      }
    }
  }
}
