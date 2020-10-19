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
    return ListView2Demo();
  }
}

// 带分割线的 ListView
class ListView2Demo extends StatelessWidget {
  const ListView2Demo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.people),
            trailing: Icon(Icons.favorite),
            title: Text("动态标题 ${index + 1}"),
            subtitle: Text("子标题子标题子标题子标题子标题子标题子标题子标题"),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.black, height: 50, indent: 60, thickness: 2);
        },
        itemCount: 100);
  }
}

// 动态创建 ListView
class ListView1Demo extends StatelessWidget {
  const ListView1Demo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.people),
            trailing: Icon(Icons.favorite),
            title: Text("动态标题 ${index + 1}"),
            subtitle: Text("子标题子标题子标题子标题子标题子标题子标题子标题"),
          );
        }
    );
  }
}

// ListViewDemo1 静态创建
class ListViewDemo1 extends StatelessWidget {
  const ListViewDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
//      scrollDirection: Axis.horizontal,
//      reverse: true,
      // item 固定高度
      itemExtent: 100,
      // 静态item创建方式
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.favorite),
          title: Text("标题 ${index + 1}"),
          subtitle: Text("子标题子标题子标题子标题子标题子标题子标题子标题"),
        );
      }),
    );
  }
}



