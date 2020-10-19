import 'package:flutter/material.dart';
import 'about.dart';
import 'detail.dart';
import '404.dart';

main() {
  // 1、runApp 函数
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /// 路由表
      routes: {
        "/": (context) => KKHomePage(),
        KKAboutPage.routeName: (context) => KKAboutPage(),
      },
      initialRoute: "/",
      onGenerateRoute: (settings) {
        /// 路由转换
        if (settings.name == KKDetailPage.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return KKDetailPage(settings.arguments);
            }
          );
        }

        return null;
      },
      onUnknownRoute: (settings) {
        /// 404
        return MaterialPageRoute(
            builder: (context) {
              return KK404Page();
            }
        );
      },
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
  String _homeMessage = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("跳转到详情"),
            onPressed: () {
              _jumpToDetail(context);
            },
          ),
          RaisedButton(
            child: Text("跳转到关于"),
            onPressed: () {
              _jumpToAbout(context);
            },
          ),
          RaisedButton(
            child: Text("跳转到详情2"),
            onPressed: () {
              _jumpToDetail2(context);
            },
          ),
          RaisedButton(
            child: Text("跳转到404"),
            onPressed: () {
              _jumpTo404(context);
            },
          ),
          Text(_homeMessage, style: TextStyle(fontSize: 20, color: Colors.red),)
        ]
      ),
    );
  }

  void _jumpToDetail(BuildContext context) {
    /// 普通跳转方式
    ///   - 通过页面构造器传入数据
    ///   - 通过Future获取页面返回的数据
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return KKDetailPage("来自首页");
      }
    )).then((value) {
      setState(() {
        _homeMessage = value;
      });
    });
  }

  void _jumpToAbout(BuildContext context) {
    /// 命名路由
    ///  - 通过参数传入数据
    ///  - 通过Future获取页面返回的数据
    Navigator.of(context).pushNamed(KKAboutPage.routeName, arguments: "来自首页1").then((value) {
      setState(() {
        _homeMessage = value;
      });
    });
  }

  void _jumpToDetail2(BuildContext context) {
    /// 命名路由
    ///  - 通过参数传入数据
    ///  - 通过Future获取页面返回的数据
    Navigator.of(context).pushNamed(KKDetailPage.routeName, arguments: "来自首页2").then((value) {
      setState(() {
        _homeMessage = value;
      });
    });
  }

  void _jumpTo404(BuildContext context) {
    Navigator.of(context).pushNamed('/hello', arguments: "来自首页");
  }
}


