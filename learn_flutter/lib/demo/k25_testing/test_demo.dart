import 'package:flutter/material.dart';

class TestDemo {
  static String greet(String name) {
    return "hello $name";
  }
}

class TestWidget extends StatefulWidget {

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Text("hello"),
          RaisedButton(
            child: Text("$_count"),
            onPressed: () {
              setState(() {
                _count++;
              });
            },
          )

        ],
      ),
    );
  }
}
