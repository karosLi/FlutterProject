import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 1、创建自己需要共享的数据
/// 2、在app顶层创建ChangeNotifierProvider
/// 3、在widget中使用数据
///  - Provider.of: 当 provider 数据发生改变时，所在在 widget 都会重新 build
///  - Consumer(推荐，监听数据的变化): 当 provider 数据发生改变是，只会执行 Consumer 中的 build 方法。
///  - Selector(推荐，修改数据):  1、selector 对原有数据进行转换；2、rebuild 是否需要重新构建。因为可以做到在修改数据数据时，是不需要重新构建的，那么是可以提升性能的


main() {
  // 1、runApp 函数
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) {
                return KKCounterViewModel();
              }
          )
        ],
        child: MyApp(),
      )
  );
}

class KKCounterViewModel with ChangeNotifier {
  int _counter = 30;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    // 通知监听者
    notifyListeners();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            KKShowCounter1(),
            KKShowCounter2()
          ],
        ),
      ),
      floatingActionButton: Selector<KKCounterViewModel, KKCounterViewModel>(
        selector: (context, vm) => vm,
        shouldRebuild: (pre, next) => false,
        builder:  (context,  vm, child) {
          print("FloatingActionButton build");
          return FloatingActionButton(
            child: child,
            onPressed: () {
              vm.counter += 1;
            },
          );
        },
        child: Icon(Icons.add),
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
    final counter = Provider.of<KKCounterViewModel>(context).counter;

    print("KKShowCounter1");

    return Card(
      color: Colors.red,
      child: Text("当前计数：$counter", style: TextStyle(fontSize: 30),),
    );
  }
}

class KKShowCounter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("KKShowCounter2");

    return Container(
        color: Colors.blue,
        child: Consumer<KKCounterViewModel>(
          builder:  (context,  vm, child) {
            return Text("当前计数：${vm.counter}", style: TextStyle(fontSize: 30));
          },
        )
    );
  }
}


