import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

main() {
  // 1、runApp 函数
  runApp(MyApp());
}

class KKCounterWidget extends InheritedWidget {
  final int counter;

  KKCounterWidget({this.counter, Widget child}): super(child: child);

  static KKCounterWidget of(BuildContext context) {
    // 沿着 Element 树，从找到最近的 InheritedElement，然后从 element 中获取 KKCounterWidget 对象
    return context.dependOnInheritedWidgetOfExactType<KKCounterWidget>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // 是否需要通知state，它的依赖发生了改变
    return true;
  }
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
  int _counter = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: KKCounterWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              KKShowCounter1(),
              KKShowCounter2()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter++;
          });

        },
      ),
    );
  }
}

class KKShowCounter1 extends StatefulWidget {

  @override
  _KKShowCounter1State createState() => _KKShowCounter1State();
}

class _KKShowCounter1State extends State<KKShowCounter1> {
  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    final counter = KKCounterWidget.of(context).counter;

    return Card(
      color: Colors.red,
      child: Text("当前计数：$counter", style: TextStyle(fontSize: 30),),
    );
  }
}

class KKShowCounter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = KKCounterWidget.of(context).counter;

    return Container(
      color: Colors.blue,
      child: Text("当前计数：$counter", style: TextStyle(fontSize: 30)),
    );
  }
}


