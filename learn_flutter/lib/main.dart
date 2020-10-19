import 'package:flutter/cupertino.dart';
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
      theme: ThemeData(
        // 设置主题亮度
        brightness: Brightness.light,
        // 前景色 tintColor，包含了 primaryColor 和 accentColor
        primarySwatch: Colors.red,
        // 单独设置 primaryColor：用于设置 导航 和 tabBar 颜色
        primaryColor: Colors.green,
        // 单独设置 accentColor：用于设置 浮动按钮 和 switch 颜色
        accentColor: Colors.orange,
        // 按钮主题
        buttonTheme: ButtonThemeData(
          height: 25,
          minWidth: 10,
          buttonColor: Colors.pink
        ),
        // card 主题
        cardTheme: CardTheme(
          shadowColor: Colors.teal,
          // 阴影长度
          elevation: 10
        ),
        // 文本主题
        textTheme: TextTheme(
          // 设置文本大小
          bodyText2: TextStyle(fontSize: 30, color: Colors.purple),
          bodyText1: TextStyle(fontSize: 50)
        ),
      ),
      darkTheme: ThemeData(
        // 设置主题亮度
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        // 文本主题
        textTheme: TextTheme(
          // 设置文本大小
            bodyText2: TextStyle(fontSize: 30, color: Colors.blueGrey),
            bodyText1: TextStyle(fontSize: 50, color: Colors.blueGrey)
        ),
      ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.find_in_page),
              title: Text("发现")
          )
        ],
        unselectedFontSize: 14,
        selectedFontSize: 14,
        onTap: (int index) {

        },
      ),
      body: KKHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Text("发帖"),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return KKDetailPage();
            }
          ));
        },
      ),
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
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Switch(
            value: true,
            onChanged: (value) {

            }
          ),
          CupertinoSwitch(
            activeColor: Colors.red[400],
            value: true,
            onChanged: (value) {

            }
          ),
          RaisedButton(
            child: Text("SS"),
            onPressed: () {

            },
          ),
          Card(
            child: Text("阿士大夫", style: TextStyle(fontSize: 30)),
          ),
          Text("O(∩_∩)O哈哈~"),
          Text("O(∩_∩)O哈哈~", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.bodyText1.fontSize)),
        ],
      ),
    );
  }
}


class KKDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 局部主题
    return Theme(
      data: Theme.of(context).copyWith(
        // 修改当前页面导航栏颜色
        primaryColor: Colors.red,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          // 修改当前页面浮动按钮颜色
          secondary: Colors.red
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
        ),
        body: Center(
          child: Text("详情页"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text("发帖1"),
          onPressed: () {

          },
        )
      ),
    );
  }
}


