import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'widgets//start_rating.dart';
import 'pages/main/main.dart';

main() {
  // 1、runApp 函数
  runApp(MyApp());
}

/**
 * https://www.jianshu.com/p/6e48425d2c63
 * https://github.com/wanglin2/douban_api
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      home: KKMainPage(),
    );
  }
}


