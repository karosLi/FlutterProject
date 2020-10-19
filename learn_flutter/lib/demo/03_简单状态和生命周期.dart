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

class _KKHomePageState extends State<KKHomePage> {

  @override
  Widget build(BuildContext context) {
    print("调用_KKHomePageState的build");
    return Scaffold(
      appBar: AppBar(
        title: Text("计数器"),
      ),
      body: KKHomeContent("你好啊"),
      floatingActionButton: RaisedButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              print("让父组件重建");
            });
          }
      ),
    );
  }
}

// StatefullWidget 声明周期
class KKHomeContent extends StatefulWidget {
  final String message;

  KKHomeContent(String message): message = message {
    print("1、调用KKHomeContent的constructor方法");
  }

  @override
  _KKHomeContentState createState() {
    print("2、调用KKHomeContent的createState方法");
    return _KKHomeContentState();
  }
}

/**
 * 为什么flutter在设计的时候StatefulWidget的build方法放在State中
 * 1、build出来的widget需要依赖State中的变量
 * 2、在flutter的运行过程中：
 *      2.1、widget是不断销毁和创建的
 *      2.2、当我们状态改变时，并不需要创建一个新的State
 */
class _KKHomeContentState extends State<KKHomeContent> {
  int _count = 0;

  _KKHomeContentState() {
    print("3、调用_KKHomeContentState的constructor方法");
  }

  @override
  void initState() {
    print("4、调用_KKHomeContentState的initState方法");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("5、调用_KKHomeContentState的build方法");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getButtons(),
          Text("当前计数: $_count", style: TextStyle(fontSize: 30)),
          Text("传递的信息: ${widget.message}")
        ],
      ),
    );
  }

  @override
  void dispose() {
    print("6、调用_KKHomeContentState的dispose方法");
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 当State的依赖变更时调用
    print("调用_KKHomeContentState的didChangeDependencies方法");
  }

  @override
  void didUpdateWidget(covariant KKHomeContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 当父组件重建时（rebuild）调用
    print("调用_KKHomeContentState的didUpdateWidget方法");
  }

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text("+", style: TextStyle(fontSize: 25, color: Colors.white)),
          color: Colors.pink,
          onPressed: (){
            print("+");

            setState(() {
              _count++;
            });
          },
        ),
        RaisedButton(
          child: Text("-", style: TextStyle(fontSize: 25, color: Colors.white)),
          color: Colors.green,
          onPressed: (){
            print("-");

            setState(() {
              _count--;
            });
          },
        )
      ],
    );
  }
}



