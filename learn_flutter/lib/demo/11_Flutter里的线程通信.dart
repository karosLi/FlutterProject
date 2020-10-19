import 'package:flutter/foundation.dart';
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
  void initState() {
    super.initState();

    /**
     * Flutter 中有4个runner
     * 1、UI Runner
     * 2、GPU Runner
     * 3、IO Runner
     * 4、Flatform Runner
     */

    print("initState start");

    getResult();

    print("initState end");
  }

  void getResult() async {
    int result = await compute(calc, 100);
    print("getResult $result");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

int calc(int count) {
  int total = 0;
  for (int i = 0; i < count; i++) {
    total += i;
  }

  return total;
}

