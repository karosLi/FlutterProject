import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'network/http_request.dart';


main() {
  // 1、runApp 函数
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KKHomePage(),
    );
  }
}

class KKHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("demo"),
        ),
        body: KKHomeContent()
    );
  }
}

class KKHomeContent extends StatefulWidget {
  @override
  _KKHomeContentState createState() => _KKHomeContentState();
}

class _KKHomeContentState extends State<KKHomeContent> {

  @override
  void initState() {
    super.initState();

    sendReuqest();
  }

  void sendReuqest() async {
    var reponse = await HttpRequest.reqeust("/get", method: "GET", params: {
      "key": "v1"
    }, interceptor: InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          print("自定义请求拦截");
          return options;
        },
        onError: (DioError error) {
          print("自定义错误拦截");
          return error;
        },
        onResponse: (Response response) {
          print("自定义响应拦截");
          return response;
        }
    ));
    print(reponse);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


