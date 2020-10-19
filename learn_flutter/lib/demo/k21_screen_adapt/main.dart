import 'dart:ui';
import 'package:flutter/material.dart';
import 'size_fit.dart';

main() {
  // 1、runApp 函数
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 物理分辨率
    final double physicalWidth = window.physicalSize.width;
    final double physicalHeight = window.physicalSize.height;
    print("物理分辨率 $physicalWidth : $physicalHeight");

    // dpr
    final dpr = window.devicePixelRatio;

    // 逻辑分辨率
    final double width = physicalWidth / dpr;
    final double height = physicalHeight / dpr;
    print("逻辑分辨率 $width : $height");

    // 状态栏高度
    final double statusHeight = window.padding.top / dpr;
    print("状态栏高度 $statusHeight");

    SizeFit.init();
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
  Widget build(BuildContext context) {
    // 获取逻辑宽度和高度
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // 获取状态栏高度
    final double statusHeight = MediaQuery.of(context).padding.top;

    return Center(
      child: Container(
        color: Colors.red,
        width: 150.px,
        height: 151.0.px,
      ),
    );
  }
}


