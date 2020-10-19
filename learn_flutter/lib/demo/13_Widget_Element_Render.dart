import 'dart:ffi';

import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    /// 关于 Widget
    // 组件 Widget
    // Container -> StatelessWidget -> Widget
    // KKHomeContent -> StatefulWidget -> Widget
    Container();
    KKHomeContent();
    Text("");

    // 渲染 Widget
    // Padding -> SingleChildRenderObjectWidget -> RenderObjectWidget(声明createRenderObject抽象方法) -> Widget
    // Padding.createRenderObject() 返回 RenderPadding
    // RenderPadding -> RenderBox -> RenderObject
    Padding();
    // MultiChildRenderObjectWidget
    Column();


    /// 关于 Element
    // 所有的 Widget 都会创建一个对应的 Element

    // 组件 Widget 创建的 Element 有两个
    StatelessElement(null);
    StatefulElement(null);
    // StatelessElement -> ComponentElement;
    // StatefulElement -> ComponentElement;

    // Container -> (StatelessWidget.createElement() => StatelessElement(this)) -> Widget
    // KKHomeContent -> (StatefulWidget.createElement() => StatefulElement(this)) -> Widget


    // 渲染 Widget 创建的 Element
    SingleChildRenderObjectElement(null);
    // SingleChildRenderObjectElement -> RenderObjectElement;

    // Padding -> (SingleChildRenderObjectWidget.createElement() => SingleChildRenderObjectElement(this)) -> RenderObjectWidget(声明createRenderObject抽象方法) -> Widget
    MultiChildRenderObjectElement(null);

    /// 总结
    // 1、Widget 分为组件Widget和渲染Widget
    // 2、每一个 Widget 都会创建一个 Element
    // 3、ComponentsElement mount 方法 => firstBuild => rebuild => performBuild => build => _widget.build(this)
    // 4、RenderObjectElement mount 方法 => _widget.createRenderObject
    // 5、ComponentsElement 会持有_widget， RenderObjectElement 持有 _widget 和 _renderObject
    // 6、StatefulElement 构造方法里中会调用
    //  - _state = widget.createState();
    //  - _state.widget = widget
    //  - mount 方法 => firstBuild => rebuild => performBuild => build => _state.build(this)


    return Container();
  }
}


