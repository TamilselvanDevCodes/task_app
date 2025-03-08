import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../core_needs/variables/global_variables.dart';
class WebService {

  Map<String, String> postHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<dynamic> post({required
  String url,required Object? requestObject}) async {
    dynamic responseJson;
    var requestJson = jsonEncode(requestObject);

    logger.i("Service URL $url \nService requestJson $requestJson");

    try {
      logger.i("1111111111");
      final response = await http.post(Uri.parse(url),
          headers: postHeaders, body: requestJson);
      logger.i("2222222222222222222");

      responseJson = parseResponse(response);
    } on SocketException {
      throw Exception('Socket Exception Occurred');
    }
    return responseJson;
  }

  Future<dynamic> put(
      String url, dynamic requestObject) async {
    dynamic responseJson;
    var requestJson = jsonEncode(requestObject);
    try {
      final response = await http.put(Uri.parse(url),
          headers: postHeaders, body: requestJson);

      responseJson = parseResponse(response);
    } on SocketException {
      throw Exception('SocketException');
    }
    return responseJson;
  }



  dynamic parseResponse(http.Response response) {
    var responseJson = json.decode(response.body.toString());
    logger.d("Parse Response : $responseJson");
    return responseJson;
  }
}
