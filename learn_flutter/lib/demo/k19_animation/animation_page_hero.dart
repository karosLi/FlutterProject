import 'package:flutter/material.dart';
import 'detail.dart';
import 'image_detail.dart';

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

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 16 / 9,
          ),
          children: List.generate(20, (index) {
            final String src = "https://picsum.photos/200/300?random=$index";

            return GestureDetector(
              child: Hero(
                tag: src,
                child: Image.network(
                    src,
                    fit: BoxFit.cover
                ),
              ),
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 300),
                    pageBuilder: (context, animation1, animation2) {
                      return FadeTransition(
                        opacity: animation1,
                        child: KKImageDetailPage(src),
                      );
                    }
                ));
              },
            );
          }),
        )
    );
  }
}
