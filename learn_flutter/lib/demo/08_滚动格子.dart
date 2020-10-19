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
    return GridView2Demo();
  }
}

// Grid 动态创建格子--指定列数
class GridView2Demo extends StatelessWidget {
  const GridView2Demo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 100,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 指定一行有几列
            crossAxisCount: 3,
            // 宽高比
            childAspectRatio: 0.75,
            // 行间距
            mainAxisSpacing: 5,
            // 列间距
            crossAxisSpacing: 5
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256),  Random().nextInt(256),  Random().nextInt(256)),
            child: ListTile(
              leading: Icon(Icons.people),
              trailing: Icon(Icons.favorite),
              title: Text("标题 ${index + 1}"),
              subtitle: Text("子标题子标题子标题子标题子标题子标题子标题子标题"),
            ),
          );
        }
    );
  }
}

// Grid 静态创建格子--指定列宽度
class GridView1Demo extends StatelessWidget {
  const GridView1Demo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // 指定最大列宽度
          maxCrossAxisExtent: 100,
          // 宽高比
          childAspectRatio: 0.75,
          // 行间距
          mainAxisSpacing: 5,
          // 列间距
          crossAxisSpacing: 5
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256),  Random().nextInt(256),  Random().nextInt(256)),
          child: ListTile(
            leading: Icon(Icons.people),
            trailing: Icon(Icons.favorite),
            title: Text("标题 ${index + 1}"),
            subtitle: Text("子标题子标题子标题子标题子标题子标题子标题子标题"),
          ),
        );
      }),
    );
  }
}

// Grid 静态创建格子--指定列数
class GridViewDemo extends StatelessWidget {
  const GridViewDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 指定一行有几列
            crossAxisCount: 3,
            // 宽高比
            childAspectRatio: 0.75,
            // 行间距
            mainAxisSpacing: 5,
            // 列间距
            crossAxisSpacing: 5
        ),
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256),  Random().nextInt(256),  Random().nextInt(256)),
            child: ListTile(
              leading: Icon(Icons.people),
              trailing: Icon(Icons.favorite),
              title: Text("标题 ${index + 1}"),
              subtitle: Text("子标题子标题子标题子标题子标题子标题子标题子标题"),
            ),
          );
        }),
      ),
    );
  }
}

