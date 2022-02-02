import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'app_exception.dart';

class Network {
  static const String baseUrl = "https://trendingnp.com/api";
  static const String baseURLNOHTTP = "trendingnp.com/";
  // ignore: constant_identifier_names
  static const int TIME_OUT_DURATION = 40;
  final timeOutDuration = const Duration(seconds: TIME_OUT_DURATION);

  var accessToken;

  getaccessToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    accessToken = localStorage.getString('accessToken');
    print("accessToken from getaccessToken: \t $accessToken");
  }

  postAuthData(data, apiUrl) async {
    var url = baseUrl + apiUrl;

    await getaccessToken();
    try {
      var response = await http
          .post(Uri.parse(url),
              body: jsonEncode(data), headers: _setAuthHeaders())
          .timeout(timeOutDuration);

      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', url.toString());
    }
  }

  getData(apiUrl) async {
    var url = baseUrl + apiUrl;
    // await getaccessToken();
    try {
      var response = await http
          .get(Uri.parse(url), headers: _setHeaders())
          .timeout(timeOutDuration);
      return (response);
    } on SocketException {
      throw FetchDataException('No Internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', url.toString());
    }
  }

  getWithParams(data, apiUrl) async {
    var url = baseURLNOHTTP + apiUrl;
    var uri = Uri.http(baseURLNOHTTP, apiUrl, data);
    await getaccessToken();
    try {
      var response = await http.get(uri, headers: _setAuthHeaders());
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', url.toString());
    }
  }

  getAuthData(apiUrl) async {
    var url = baseUrl + apiUrl;

    await getaccessToken();
    try {
      var response = await http.get(Uri.parse(url), headers: _setAuthHeaders());
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', url.toString());
    }
  }

  postData(data, apiUrl) async {
    var url = baseUrl + apiUrl;
    await getaccessToken();
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: _setHeaders(),
        body: jsonEncode(data),
      );
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', url.toString());
    }
  }

  postFile(fileName, apiUrl) async {
    var url = baseUrl + apiUrl;
    await getaccessToken();
    try {
      var response = http.MultipartRequest('POST', Uri.parse(url));
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', url.toString());
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/vnd.api+json',
        // 'xpsu': '12345678'
      };

  _setAuthHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/vnd.api+json',
        'xpsu': '12345678',
        'Authorization': 'Bearer $accessToken',
        'Charset': 'utf-8'
      };

  // _returnResponse(http.Response response) {
  //   switch (response.statusCode) {
  //     case 200:
  //       var responseJson = utf8.decode(response.bodyBytes);
  //       return responseJson;
  //     case 201:
  //       var responseJson = utf8.decode(response.bodyBytes);
  //       return responseJson;
  //     case 400:
  //       throw BadRequestException(
  //           utf8.decode(response.bodyBytes), response.request!.url.toString());
  //     case 401:
  //     case 403:
  //       throw UnAuthorizedException(
  //           utf8.decode(response.bodyBytes), response.request!.url.toString());
  //     case 422:
  //       throw BadRequestException(
  //           utf8.decode(response.bodyBytes), response.request!.url.toString());
  //     case 500:
  //     default:
  //       throw FetchDataException(
  //           'Error occured with code : ${response.statusCode}',
  //           response.request!.url.toString());
  //   }
  // }
}
