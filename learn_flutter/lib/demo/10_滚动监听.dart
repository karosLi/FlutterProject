import 'dart:math';

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

class KKHomePage extends StatefulWidget {
  @override
  _KKHomePageState createState() => _KKHomePageState();
}


// ListView -- 动态创建item ，并滚动监听
class _KKHomePageState extends State<KKHomePage> {
  final ScrollController controller = ScrollController(
    // 默认偏移
      initialScrollOffset: 400
  );
  bool _showButton = false;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      print("监听滚动 ${controller.offset}");
      setState(() {
        _showButton = controller.offset >= 1000;
      });
    });


  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /**
     * 有两种监听方式
     * 1、Controller
     *  - 可以设置默认的偏移
     *  - 监听滚动，也可以设置监听滚动的位置
     * 2、NotificationListener
     *  - 监听开始和结束滚动
     */
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            print("开始滚动...");
          } else if (notification is ScrollUpdateNotification) {
            print("正在滚动...总滚动的范围：${notification.metrics.maxScrollExtent} 当前滚动的位置：${notification.metrics.pixels}");
          } else if (notification is ScrollEndNotification) {
            print("结束滚动...");
          }

          return true;
        },
        child: ListView.builder(
            controller: controller,
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.people),
                trailing: Icon(Icons.favorite),
                title: Text("动态标题 ${index + 1}"),
                subtitle: Text("子标题子标题子标题子标题子标题子标题子标题子标题"),
              );
            }
        ),
      ),
      floatingActionButton: _showButton ? FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          // 回到顶部
          controller.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
        },
      ) : null,
    );
  }
}
