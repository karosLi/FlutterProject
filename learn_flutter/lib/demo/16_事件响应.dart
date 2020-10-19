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
      home: Scaffold(
          appBar: AppBar(
            title: Text("demo"),
          ),
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                GestureDetector(
                  onTapDown: (details) {
                    print("outer click $details");
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.yellow,
                    alignment: Alignment.center,
                  ),
                ),
                GestureDetector(
                  onTapDown: (details) {
                    print("inner click $details");
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

// 手势
class GestureDemo extends StatelessWidget {
  const GestureDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        print("手指按下 ${details.globalPosition} ${details.localPosition}");
      },
      onTapUp: (details) {
        print("手指抬起 ${details.globalPosition} ${details.localPosition}");
      },
      onTapCancel: () {
        print("手指取消");
      },
      onTap: () {
        print("手指点击");
      },
      onDoubleTap:  () {
        print("手指双击");
      },
      onLongPress:  () {
        print("手指长按");
      },
      child: Container(
        color: Colors.green,
        width: 200,
        height: 200,
      ),
    );
  }
}

// 指针demo
class ListenerDemo extends StatelessWidget {
  const ListenerDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print("指针按下 $event");
      },
      onPointerMove: (event) {
        print("指针移动 $event");
      },
      onPointerUp: (event) {
        print("指针抬起 $event");
      },
      onPointerCancel: (event) {
        print("指针取消 $event");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}

