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
        title: Text("列表"),
      ),
      body: KKHomeContent(),
    );
  }
}

class KKHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        KKHomeProductItem("Apple1", "Macbook1", "http://karosli.com/2018/02/10/%E4%BB%BF%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87%E5%8E%8B%E7%BC%A9%E6%96%B9%E5%BC%8F/4_1080%E2%80%86%C3%97%E2%80%862160_204%20KB_wechat.JPG"),
        KKHomeProductItem("Apple2", "Macbook2", "http://karosli.com/2018/02/10/%E4%BB%BF%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87%E5%8E%8B%E7%BC%A9%E6%96%B9%E5%BC%8F/2_900%E2%80%86%C3%97%E2%80%861600_168%20KB.JPG"),
        KKHomeProductItem("Apple3", "Macbook3", "http://karosli.com/2018/02/10/%E4%BB%BF%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87%E5%8E%8B%E7%BC%A9%E6%96%B9%E5%BC%8F/3_1080%E2%80%86%C3%97%E2%80%861920_269%20KB.JPG"),
      ],
    );
  }
}

class KKHomeProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  final style = TextStyle(fontSize: 25, color: Colors.orange);
  final style1 = TextStyle(fontSize: 20, color: Colors.green);

  KKHomeProductItem(this.title, this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
              width: 5,
              color: Colors.red
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: style),
          SizedBox(height: 8),
          Text(desc, style: style1),
          SizedBox(height: 8),
          Image.network(imageURL, fit: BoxFit.fill)
        ],
      ),
    );
  }
}


