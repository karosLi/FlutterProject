import 'package:flutter/material.dart';
import 'package:foodcourt/core/router/router.dart';
import 'package:foodcourt/ui/shared/size_fit.dart';
import 'package:foodcourt/core/model/category_model.dart';
import 'package:foodcourt/core/services/json_parse.dart';

class FCHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // 拿到 tab bar 界面
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: FCHomeContentBuilder(),
    );
  }
}

/// 通过 future builder 来获取数据 - 适合非分页场景
class FCHomeContentBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FCCategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (context, snapshots) {
        if (!snapshots.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<FCCategoryModel> categories = snapshots.data;
        return GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.px,
              mainAxisSpacing: 20.px,
              childAspectRatio: 1.5
          ),
          itemBuilder: (context, index) {
            final Color bgColor = categories[index].finalColor;

            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(12.px),
                    gradient: LinearGradient(
                        colors: [
                          bgColor.withOpacity(0.7),
                          bgColor,
                        ]
                    )
                ),
                alignment: Alignment.center,
                child: Text("${categories[index].title}", style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              onTap: () {
                Navigator.of(context).pushNamed(FCRouter.mealPage, arguments: categories[index]);
              },
            );
          },
          padding: EdgeInsets.all(20.px),
        );
      },
    );
  }
}

/// 通过 state 来获取数据
class FCHomeContent extends StatefulWidget {
  @override
  _FCHomeContentState createState() => _FCHomeContentState();
}

class _FCHomeContentState extends State<FCHomeContent> {

  List<FCCategoryModel> _categories = [];

  @override
  void initState() {
    super.initState();

    JsonParse.getCategoryData().then((value) {
      _categories = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.px,
        mainAxisSpacing: 20.px,
        childAspectRatio: 1.5
      ),
      itemBuilder: (context, index) {
        final Color bgColor = _categories[index].finalColor;

        return Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.px),
            gradient: LinearGradient(
              colors: [
                bgColor.withOpacity(0.7),
                bgColor,
              ]
            )
          ),
          alignment: Alignment.center,
          child: Text("${_categories[index].title}")
        );
      },
      padding: EdgeInsets.all(20.px),
    );
  }
}

