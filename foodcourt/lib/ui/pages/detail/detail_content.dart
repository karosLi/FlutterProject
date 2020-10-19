import 'package:flutter/material.dart';
import 'package:foodcourt/ui/shared/size_fit.dart';
import 'package:foodcourt/core/model/meal_model.dart';

class FCDetailContent extends StatelessWidget {
  final FCMealModel _model;
  FCDetailContent(this._model);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
         children: <Widget>[
           buildBannerImage(),
           buildMakeTitle(context, "制作材料"),
           buildMakeMaterial(context),
           buildMakeTitle(context, "制作步骤"),
           buildMakeSteps(context),
           SizedBox(height: 20)
         ],
      ),
    );
  }

  Widget buildBannerImage() {
    return Container(
      child: Image.network(_model.imageUrl, width: double.infinity, height: 250.px, fit: BoxFit.cover),
    );
  }

  Widget buildMakeMaterial(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.builder(
        // 高度由内容包裹计算得来
        shrinkWrap: true,
        // 视图不滚动
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 3.px),
        itemCount: _model.ingredients.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.amber,
            child: Padding(
              padding: EdgeInsets.all(4.px),
              child: Text(_model.ingredients[index], style: TextStyle(fontSize: 12),),
            ),
            elevation: 0,
            margin: EdgeInsets.symmetric(vertical: 3.px, horizontal: 4.px),
          );
        }
      )
    );
  }

  Widget buildMakeSteps(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.separated(
        // 高度由内容包裹计算得来
        shrinkWrap: true,
        // 视图不滚动
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 3.px),
        itemCount: _model.steps.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text("#${index +1 }"),
            ),
            title: Text(_model.steps[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      )
    );
  }

  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget buildMakeContent({@required BuildContext context, Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.px),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.px),
          border: Border.all(color: Colors.grey)
      ),
      child: child,
    );
  }
}
