import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'http_config.dart';


class HttpResponse<T> {
  /// 响应 body
  T data;

  /// 状态码
  int statusCode;

  /// 状态描述
  String statusMessage;

  HttpResponse({this.data, this.statusCode, this.statusMessage});
}

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);

  static Future<HttpResponse<T>> request<T>(
        String url, {
        String method = 'GET',
        Map<String, dynamic> headers,
        Map<String, dynamic> queryParameters,
        String contentType,
        data,
        Interceptor interceptor
      }) async {

    // 创建单独配置
    final Options options = RequestOptions(method: method, headers: headers, contentType: contentType ?? 'application/json', responseType: ResponseType.json);

    // 设置默认全局拦截器
    Interceptor filter = InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        return options;
      },
      onError: (DioError error) {
        Fluttertoast.showToast(
          msg: error.message,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0
        );
        return error;
      },
      onResponse: (Response response) {
        return response;
      }
    );
    List<Interceptor> filters = [filter];

    // 添加外部拦截器
    if (interceptor != null) {
      filters.add(interceptor);
    }
    dio.interceptors.addAll(filters);

    // 信任证书
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port){
        return true;
      };
    };

    // 发送数据
    Response<T> response;
    try {
      response = await dio.request<T>(url, queryParameters: queryParameters, options: options, data: data);
    } on DioError catch(e) {
      // 网络错误
      return Future.error(e);
    }

    return HttpResponse<T>(data: response.data, statusCode: response.statusCode, statusMessage: response.statusMessage);
  }

}