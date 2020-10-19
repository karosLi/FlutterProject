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
          title: Text("基础Widget"),
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
    return FormWidgetDemo();
  }
}

// 表单demo
class FormWidgetDemo extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Theme(
        data: ThemeData(
            primaryColor: Colors.green
        ),
        child: Column(
          children: <Widget>[
            TextField(
              controller: userController,
              decoration: InputDecoration(
                  labelText: "用户名：",
                  icon: Icon(Icons.people),
                  hintText: "请输入用户名",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.red[100]
              ),
              onChanged: (value) {

              },
              onSubmitted: (value) {

              },
            ),
            SizedBox(height: 8),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "密码：",
                  icon: Icon(Icons.lock),
                  hintText: "请输入密码",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.red[100]
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 40,
              child: FlatButton(
                child: Text("登录", style: TextStyle(fontSize: 20, color: Colors.red)),
                color: Colors.blue,
                onPressed: () {
                  final userName = userController.text;
                  final password = passwordController.text;

                  print("用户名： $userName, 密码：$password");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


//Iconfont
class IconfontDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Icon(Icons.pets, size: 40, color: Colors.pink);
//    return Icon(IconData(0xe91d, fontFamily: 'MaterialIcons'), size: 40, color: Colors.pink);
    return Text("\ue91d", style: TextStyle(fontFamily: 'MaterialIcons', fontSize: 40));
  }
}


//Image Placeholder
class ImagePlaceholderDemo extends StatelessWidget {
  const ImagePlaceholderDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        fadeInDuration: Duration(milliseconds: 3000),
        fadeOutDuration: Duration(milliseconds: 30),
        placeholder: AssetImage("assets/images/image.jpeg"),
        image: NetworkImage("https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3744924158,1824985192&fm=26&gp=0.jpg")
    );
  }
}

// Image 组件-本地图片
class ImageDemo1 extends StatelessWidget {
  const ImageDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
//    1、建立文件夹存放图片
//    2、pubspec.yaml 添加配置
//    3、使用图片
      image: AssetImage("assets/images/image.jpeg"),
    );
  }
}

// Image 组件-网络图片
class ImageDemo extends StatelessWidget {
  const ImageDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 5,
              color: Colors.red
          )
      ),
      child: Image(
        width: 300,
        height: 300,
        fit: BoxFit.contain,
//        alignment: Alignment.bottomCenter,
//        color: Colors.red,
//        colorBlendMode: BlendMode.colorDodge,
//        repeat: ImageRepeat.repeat,
        image: NetworkImage("https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3744924158,1824985192&fm=26&gp=0.jpg"),
      ),
    );
  }
}



// Button
class ButtonDemo extends StatelessWidget {
  const ButtonDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
            child: Text("RaisedButton"),
            color: Colors.pink,
            textColor: Colors.white,
            onPressed: (){

            }
        ),
        ButtonTheme(
            minWidth: 30,
            height: 20,
            child: FlatButton(
                child: Text("FlatButton"),
                color: Colors.green,
                textColor: Colors.white,
                //去除上下间距
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //去除内边距
                padding: EdgeInsets.all(0),
                onPressed: (){

                }
            )
        ),
        OutlineButton(
            child: Text("OutlineButton"),
            color: Colors.blue,
            textColor: Colors.black,
            onPressed: (){

            }
        ),
        FloatingActionButton(
            child: Text("Floating", style: TextStyle(fontSize: 10)),
            onPressed: (){

            }
        ),
        // 自定义按钮
        FlatButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.face),
                Text("喜欢"),
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            color: Colors.green,
            textColor: Colors.white,
            onPressed: (){

            }
        ),
      ],
    );
  }
}

// TextRich 富文本
class TextRichDemo extends StatelessWidget {
  const TextRichDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        children: [
          TextSpan(
              text: "dddd",
              style: TextStyle(color: Colors.red)
          ),
          TextSpan(
              text: "dadfg",
              style: TextStyle(color: Colors.green)
          ),
          WidgetSpan(
              child: Icon(Icons.face, color: Colors.pink)
          ),
          TextSpan(
              text: "dsfgfdsg",
              style: TextStyle(color: Colors.yellow)
          )
        ],
        style: TextStyle(fontSize: 30)
    ));
  }
}

// Text Widget
class TextDemo extends StatelessWidget {
  const TextDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "人生，不是一成不变的，生活，不是固定不变的。得意时不要炫耀，失意时不要气馁，给别人一点真诚，给自己一份信心。做人重要的是学会宽容，不要刻意地笑话别人，或许今天你是欢乐的，明天会是失落的，人生多变，包容不变",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
//      textScaleFactor: 1.5,
      style: TextStyle(
          fontSize: 20,
          color: Colors.red,
          fontWeight: FontWeight.bold
      ),
    );
  }
}




