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
          title: Text("多子布局"),
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
    return StackDemo();
  }
}


//1、Row 基本使用
class RowDemo extends StatelessWidget {
  const RowDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * Row特点
     * - 水平方向尽量占用比较大的空间
     *  - 如果期望水平方向也要包裹内容，那么需要设置 mainAxisSize = MainAxisSize.min
     * - 垂直方向包裹内容
     *
     * mainAxisAlignment
     * - start: 主轴开始位置挨个排放元素
     * - end: 主轴结束位置挨个排放元素
     * - center: 主轴中心点对齐
     * - spaceBetween: 左右两边间距为0，其他元素平分剩余间距
     * - spaceAround: 两边间距是其他元素间距的一半
     * - spaceEvenly: 所有元素的间距相等
     *
     * crossAxisAlignment
     * - start: 交叉轴开始位置对齐
     * - end: 交叉轴结束位置对齐
     * - center: 交叉轴中心点位置对齐
     * - baseline: 基线对齐（有文本才起效果）
     * - stretch: 先将row在交叉轴上拉伸到尽可能大的空间，然后所有元素的高度在交叉轴上拉伸到最大
     *
     * Row和Column的相比只是方向不一样
     */
    return Container(
      height: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Container(width: 80, height: 60, color: Colors.blue, child: Text("Aa", style: TextStyle(fontSize: 30))),
          Container(width: 70, height: 50, color: Colors.red, child: Text("Bb", style: TextStyle(fontSize: 20))),
          Container(width: 30, height: 90, color: Colors.green, child: Text("Cc", style: TextStyle(fontSize: 16))),
          Container(width: 90, height: 70, color: Colors.pink, child: Text("Dd", style: TextStyle(fontSize: 40))),
        ],
      ),
    );
  }
}


//2、Column 基本使用
class ColDemo extends StatelessWidget {
  const ColDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Container(width: 80, height: 60, color: Colors.blue, child: Text("Aa", style: TextStyle(fontSize: 30))),
        Container(width: 70, height: 50, color: Colors.red, child: Text("Bb", style: TextStyle(fontSize: 20))),
        Container(width: 30, height: 90, color: Colors.green, child: Text("Cc", style: TextStyle(fontSize: 16))),
        Container(width: 90, height: 70, color: Colors.pink, child: Text("Dd", style: TextStyle(fontSize: 40))),
      ],
    );
  }
}


//3、Flexible 扩展使用
class Row1Demo extends StatelessWidget {
  const Row1Demo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
//      mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          /**
           * Flexible 中的属性
           * flex 扩展系数
           *
           * fit 扩展类型
           *  - loose: 不会扩展元素占用剩余空间
           *  - tight: 扩展元素占用剩余空间
           */
          Flexible(
              fit: FlexFit.tight,
//            flex: 1,
              child: Container(width: 100, height: 60, color: Colors.blue)
          ),
          Flexible(
              fit: FlexFit.tight,
//            flex: 1,
              child: Container(width: 50, height: 50, color: Colors.red)
          ),
          Container(width: 30, height: 90, color: Colors.green),
          Container(width: 90, height: 70, color: Colors.pink),
        ],
      ),
    );
  }
}

//4、Expanded 扩展使用
class Row2Demo extends StatelessWidget {
  const Row2Demo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
//      mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          /**
           * Expanded 继承 Flexible （fit=tight）
           * flex 扩展系数，会覆盖元素的 width 属性
           *
           * 不元素元素宽度=((总宽度-固定元素宽度总和)/ 不固定元素的flex总和) * 不固定元素的flex系数
           *
           */
          Expanded(
              flex: 1,
              child: Container(width: 100, height: 60, color: Colors.blue)
          ),
          Expanded(
              flex: 2,
              child: Container(width: 50, height: 50, color: Colors.red)
          ),
          Container(width: 30, height: 90, color: Colors.green),
          Container(width: 90, height: 70, color: Colors.pink),
        ],
      ),
    );
  }
}

//4、Expanded 扩展使用
class Row3Demo extends StatelessWidget {
  const Row3Demo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
//      mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          /**
           * Expanded 继承 Flexible （fit=tight）
           * flex 扩展系数
           *
           * 不固定元素元素宽度=((总宽度-固定元素宽度总和)/ 不固定元素的flex总和) * 不固定元素的flex系数
           *
           */
          Expanded(
              flex: 1,
              child: Container(width: 100, height: 60, color: Colors.blue)
          ),
          Expanded(
              flex: 2,
              child: Container(width: 50, height: 50, color: Colors.red)
          ),
          Container(width: 300, height: 90, color: Colors.green),
          Container(width: 75, height: 70, color: Colors.pink),
        ],
      ),
    );
  }
}


//4、Stack 使用
class StackDemo extends StatelessWidget {
  const StackDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * Stack 默认大小是包裹内容
     *
     * alignment： 从什么位置开始布局
     * fit：拉伸类型，为 expand 时，将子元素拉伸到尽可能大
     * overflow：处理超出的部分
     */
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 5, color: Colors.green)
      ),
      child: Stack(
//        alignment: Alignment.bottomCenter,
        // 拉伸到尽可能大
//      fit: StackFit.expand,
        overflow: Overflow.clip,
        children: <Widget>[
          Container(width: 300, height: 200, color: Colors.red),
          Image.asset("assets/images/image.jpeg", width: 200),
          // 绝对定位
          Positioned(
              right: 0,
              bottom: 0,
              child: Text("safavid", style: TextStyle(color: Colors.blue, fontSize: 30)))
        ],
      ),
    );
  }
}


