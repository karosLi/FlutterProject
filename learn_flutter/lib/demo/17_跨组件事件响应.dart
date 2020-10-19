import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

/// 1、创建全局 eventbus
///


final EventBus eventBus = EventBus();
main() {
  // 1、runApp 函数
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("demo"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                KKButton(),
                KKText()
              ],
            ),

          )
      ),
    );
  }
}

class KKButton extends StatelessWidget {
  const KKButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("点击", style: TextStyle(fontSize: 30)),
      onPressed: () {
        eventBus.fire("你好");
      },
    );
  }
}

class KKText extends StatefulWidget {
  const KKText({
    Key key,
  }) : super(key: key);

  @override
  _KKTextState createState() => _KKTextState();
}

class _KKTextState extends State<KKText> {
  String _message = "等待改变";

  @override
  void initState() {
    super.initState();

    eventBus.on<String>().listen((event) {
      setState(() {
        _message = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("发生了改变 - $_message", style: TextStyle(fontSize: 30)),
      color: Colors.red,
    );
  }
}
