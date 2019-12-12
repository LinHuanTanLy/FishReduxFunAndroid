import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_android_fun/utils/SpUtils.dart';

import 'EnvConf.dart';

class DioUtils {
  static DioUtils _dioUtils;
  static var _cookie;
  Dio _dio = Dio();

  String _methodGet = "get";
  String _methodPost = "post";

  static DioUtils getInstance() {
    if (_dioUtils == null) {
      _dioUtils = DioUtils();
    }
    return _dioUtils;
  }

  DioUtils() {
    // 通用header
    _dio.options.headers = {};
    _dio.options.baseUrl = EnvConf.url;
    _dio.options.connectTimeout = 15000;
    _dio.options.receiveTimeout = 15000;
    _dio.options.headers = getHeaders();
    _dio.interceptors.add(LogInterceptor(responseBody: true)); //是否开启请求日志
//    dio.interceptors.add(CookieManager(CookieJar()));//缓存相关类，具体设置见https://github.com/flutterchina/cookie_jar
  }

  getHeaders() {
    return {
      'Accept': 'application/json, text/plain, */*',
      'Content-Type': 'application/json',
      'Authorization': "**",
      'User-Aagent': "4.1.0;android;6.0.1;default;A001",
      "HZUID": "2",
    };
  }

  doGet(String url, Function success,
      {Map<String, dynamic> params, Function error}) {
    _requestHttp(url, params, success,
        errorCallback: error, method: _methodGet);
  }

  doPost(String url, Function success,
      {Map<String, dynamic> params, Function error}) {
    _requestHttp(url, params, success,
        errorCallback: error, method: _methodPost);
  }

  _requestHttp(
      String url, Map<String, dynamic> params, Function successCallback,
      {String method, Function errorCallback}) async {
    Response _response;
    try {
      if (params == null) {
        params = Map();
      }
      if (_cookie != null) {
        params['Cookie'] = _cookie;
      }
      if (method == _methodGet) {
        _response = await _dio.get(url, queryParameters: params);
      } else {
        FormData _forData = FormData();
        if (params != null && params.isNotEmpty == true) {
          _forData = FormData.fromMap(params);
        }
        print('_forData is ${params.toString()}');
        _response = await _dio.post(url, data: _forData);
      }
      _cookie = _response.headers['set-cookie'];
      if (_cookie != null) {
        SpUtils.putString('cookie', _cookie).then((bool) {
          print('保存cookie 的结果是 $bool , and the cookie is $_cookie');
        });
      }
    } on DioError catch (e) {
      Response _errorResponse;
      if (e != null) {
        _errorResponse = e.response;
      } else {
        _errorResponse = Response(statusCode: 500);
      }
      print(_errorResponse);
      _errBack(errorCallback, e.message);
      return;
    }
    String dataStr = json.encode(_response.data);
    Map<String, dynamic> dataMap = json.decode(dataStr);
    if (dataMap == null || dataMap['errorCode'] != 0) {
      _errBack(errorCallback, dataMap["errorMsg"] ?? '网络不给力');
    } else {
      successCallback(dataMap);
    }
  }

  _errBack(Function errCallback, String error) {
    if (errCallback != null) {
      errCallback(error);
    }
  }
}
