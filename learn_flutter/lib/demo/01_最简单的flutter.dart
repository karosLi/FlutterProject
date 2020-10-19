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
        home: KKHomePage()
    );
  }
}

class KKHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("第一个Flutter程序")
        ),
        body: KKContentBody()
    );
  }
}

class KKContentBody extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return KKContentBodyState();
  }
}

class KKContentBodyState extends State<KKContentBody> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
                value: flag,
                onChanged:(value) {
                  setState(() {
                    flag = value;
                  });
                }
            ),
            Text("Hello")
          ],
        )
    );
  }
}