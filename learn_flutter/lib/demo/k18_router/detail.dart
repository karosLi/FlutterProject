import 'package:flutter/material.dart';

class KKDetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  final String message;

  KKDetailPage(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
        leading: IconButton(
          icon: Icon(Icons.backspace),
          onPressed: () {
            _backToHome(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("详情页 $message"),
            RaisedButton(
              child: Text("返回"),
              onPressed: () {
                _backToHome(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    Navigator.of(context).pop("来自详情页");
  }
}
