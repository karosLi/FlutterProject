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
//      appBar: AppBar(
//        title: Text("demo"),
//      ),
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
    return CustomScrollView1Demo();
  }
}

// 多 sliver
class CustomScrollView1Demo extends StatelessWidget {
  const CustomScrollView1Demo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          // 滚动到导航栏为止
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Hello"),
            background: Image.asset("assets/images/image.jpeg", fit: BoxFit.cover),
          ),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    color: Color.fromARGB(255, Random().nextInt(256),  Random().nextInt(256),  Random().nextInt(256)),
                    child: ListTile(
                      leading: Icon(Icons.people),
                      trailing: Icon(Icons.favorite),
                      title: Text("标题 ${index + 1}"),
                      subtitle: Text("子标题子标题子标题子标题子标题子标题子标题子标题"),
                    ),
                  );
                },
                childCount: 4
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1
            )
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  color: Color.fromARGB(255, Random().nextInt(256),  Random().nextInt(256),  Random().nextInt(256)),
                  child: ListTile(
                    leading: Icon(Icons.people),
                    trailing: Icon(Icons.favorite),
                    title: Text("标题 ${index + 1}"),
                    subtitle: Text("子标题子标题子标题子标题子标题子标题子标题子标题"),
                  ),
                );
              },
              childCount: 100
          ),
        )
      ],
    );
  }
}

// 单 sliver
class CustomScrollViewDemo extends StatelessWidget {
  const CustomScrollViewDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverPadding(
            padding: EdgeInsets.all(5),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        color: Color.fromARGB(255, Random().nextInt(256),  Random().nextInt(256),  Random().nextInt(256)),
                        child: ListTile(
                          leading: Icon(Icons.people),
                          trailing: Icon(Icons.favorite),
                          title: Text("标题 ${index + 1}"),
                          subtitle: Text("子标题子标题子标题子标题子标题子标题子标题子标题"),
                        ),
                      );
                    },
                    childCount: 100
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.75
                )
            ),
          ),
        )
      ],
    );
  }
}
