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

class _KKHomeContentState extends State<KKHomeContent> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    // 1、创建AnimationController
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        lowerBound: 0,
        upperBound: 1
    );

    // 2、构建animation
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    // 3、Tween 可以修改值范围
    _animation = Tween(begin: 50.0, end: 150.0).animate(_controller);

    // 4、监听值变化，并rebuild
    _controller.addListener(() {
      setState(() {

      });
    });

    // 5、监听动画状态
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 在播放结束时，再反转播放
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 在播放起点时
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.favorite, color: Colors.red, size: _animation.value),
//            KKAnimationIcon(_animation),
            RaisedButton(
              child: Text("播发动画"),
              onPressed: () {
                if (_controller.isAnimating) {//正在播放动画
                  _controller.stop();
                } else if (_controller.status == AnimationStatus.forward) {// 停止播放，并且当前状态是向前时
                  _controller.forward();
                } else if (_controller.status == AnimationStatus.reverse) {// 停止播放，并且当前状态是向后时
                  _controller.reverse();
                } else {// 动画起点状态
                  _controller.forward();
                }

              },
            )
          ],
        )
    );
  }
}

/// 动画优化 - 局部刷新UI
class KKAnimationIcon extends AnimatedWidget {
  KKAnimationIcon(Animation animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    // 局部刷新icon
    Animation animation = listenable;
    return Icon(Icons.favorite, color: Colors.red, size: animation.value);
  }
}



