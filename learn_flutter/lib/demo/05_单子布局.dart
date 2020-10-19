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
          title: Text("单子布局"),
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
  Widget build(BuildContext context) {
    return ContainerDemo();
  }
}

// ContainerDemo
class ContainerDemo extends StatelessWidget {
  const ContainerDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
//      alignment: Alignment(0, 0),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
//      transform: Matrix4.rotationZ(50),
      child: Icon(Icons.people, size: 50),
//      color: Colors.green,
      decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.red, width: 5),
//        borderRadius: BorderRadius.circular(10),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.yellow, offset: Offset(10, 10), spreadRadius: 5, blurRadius: 10),
            BoxShadow(color: Colors.blue, offset: Offset(-5, 5), spreadRadius: 0, blurRadius: 10),
          ]
      ),
    );
  }
}

// PaddingDemo
class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("来了老弟", style: TextStyle(fontSize: 30, backgroundColor: Colors.red)),
    );
  }
}

// AlignDemo
class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.green,
      child: Align(
          alignment: Alignment.bottomRight,
//        根据子视图的宽高乘以倍数，计算布局容器的大小，跟父容器的宽高只能选其一
//        widthFactor: 5,
//        heightFactor: 5,
          child: Icon(Icons.people, size: 50)
      ),
    );
  }
}




