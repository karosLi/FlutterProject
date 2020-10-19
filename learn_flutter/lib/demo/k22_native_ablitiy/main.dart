import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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
        title: Text("原生能力"),
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
  static const platform = const MethodChannel("com.kk");
  
  PickedFile _imageFile;
  int _batteryLevel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("选择照片"),
            onPressed: () {
              pickImage();
            },
          ),
          _imageFile == null ? Text("请选择一张照片") : Image.file(File(_imageFile.path)),
          RaisedButton(
            child: Text("获取剩余电量"),
            onPressed: () {
              getBatteryInfo();
            },
          ),
          Text("当前电量：${_batteryLevel ?? 0}")
        ],
      ),
    );
  }

  void pickImage() async {
    final ImagePicker piker = ImagePicker();
    PickedFile file = await piker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = file;
    });
  }
  
  void getBatteryInfo() async {
    final result = await platform.invokeMethod("getBatteryLevel");
    setState(() {
      _batteryLevel = result;
    });
  }
  
}


