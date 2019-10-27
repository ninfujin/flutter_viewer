import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_viewer/models/travel_model.dart';

const String TRAVEL_URL =
    'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';

// 该类目前考虑用于请求数据并解析，是否在此处序列化暂定，如果序列化的话，该类承担太多职责，view和该类都要耦合模型
// 但是在该类进行序列化，外部调用简单，实现该类的最大作用

class HttpRequestHelper {

  /// 旅拍子项模块
  static Future<TravelItemModel> getTravelItemData(String url, Map<String, dynamic> params) async {

    Map<String, dynamic> finalParams = {
      "districtId": -1,
      "groupChannelCode": "RX-OMF",
      "type": null,
      "lat": -180,
      "lon": -180,
      "locatedDistrictId": 0,
      "pagePara": {
        "pageIndex": 1,
        "pageSize": 10,
        "sortType": 9,
        "sortDirection": 0
      },
      "imageCutType": 1,
      "head": {'cid': "09031014111431397988"},
      "contentType": "json"
    };

    Map pageParam = finalParams['pagePara'];
    pageParam['pageIndex'] = params['pageIndex'] ?? 0;
    pageParam['pageSize'] = params['pageSize'] ?? 10;
    finalParams['groupChannelCode'] = params['groupChannelCode'] ?? '';

    final response = await http.post(url, body: jsonEncode(params));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return TravelItemModel.fromJson(result);
    } else {
      throw Exception('Failed to load travel');
    }
  }
}