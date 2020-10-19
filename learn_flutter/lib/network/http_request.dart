import 'package:dio/dio.dart';
import 'http_config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);

  static Future reqeust(
        String url, {
        String method = "GET",
        Map<String, dynamic> headers,
        Map<String, dynamic> params,
        Interceptor interceptor
      }) async {

    // 创建单独配置
    final Options options = Options(method: method, headers: headers);

    // 设置默认全局拦截器
    Interceptor filter = InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        print("请求拦截");
        return options;
      },
      onError: (DioError error) {
        print("错误拦截");
        return error;
      },
      onResponse: (Response response) {
        print("响应拦截");
        return response;
      }
    );
    List<Interceptor> filters = [filter];

    // 添加外部拦截器
    if (interceptor != null) {
      filters.add(interceptor);
    }
    dio.interceptors.addAll(filters);

    // 发送数据
    Response response;
    try {
      response = await dio.request(url, queryParameters: params, options: options);
    } on DioError catch(e) {
      return Future.error(e);
    }

    return response.data;
  }


}