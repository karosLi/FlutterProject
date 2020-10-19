import 'package:flutter/material.dart';

class KKAboutPage extends StatelessWidget {
  static const String routeName = "/about";

  KKAboutPage();

  @override
  Widget build(BuildContext context) {
    final String message = ModalRoute.of(context).settings.arguments as String;


    return Scaffold(
      appBar: AppBar(
        title: Text("关于页"),
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
            Text("关于页 $message"),
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
    Navigator.of(context).pop("来自关于页");
  }
}
