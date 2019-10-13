import 'dart:io';
import 'package:dio/dio.dart';

const String HOST_API = 'http://www.devio.org/io/flutter_app/json';

class RequestUrls {
  static const homePage = HOST_API + '/home_page.json';
  static const category = HOST_API + '/category';
  static const cart = HOST_API + '/cart';
  static const member = HOST_API + '/member';
  static const hotGoods = HOST_API + '/hotGoods';
  static const search = 'https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=';
  static const travel_tab = HOST_API + '/travel_page.json';
}

enum RequestType {
  get,
  post,
  put,
  delete
}

class HttpHelper {

  static Future startHttp(String url, {RequestType type, Map<String, dynamic> params, FormData data, Options options}) async {

    print('请求地址: $url, 类型: $type, 参数: $params');

    Response response;
    Dio dio = Dio()
    ..options.connectTimeout = 25000
    ..options.contentType = ContentType.json
    ..options.responseType = ResponseType.json;

    try {
      switch (type) {
        case RequestType.post:
          response = await dio.post(url, queryParameters: params, data: data, options: options);
          break;
        case RequestType.delete:
          response = await dio.delete(url, queryParameters: params);
          break;
        case RequestType.put:
          response = await dio.put(url, queryParameters: params);
          break;
        case RequestType.get:
        default:
          response = await dio.get(url, queryParameters: params);
      }
    } on DioError catch(e) {
      if(e.response != null && e.response.statusCode == 200) {
        return e.response.data;
      } else
      {
        return Response(statusCode: 599, statusMessage: "请求失败，请稍后再试");
      }
    }

    if(200 == response.statusCode) {
        return response.data;
    } else
    {
      throw Exception('网络请求捕获到网络异常, 接口：$url');     
    }
  }
}