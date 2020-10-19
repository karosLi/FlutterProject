import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/router/router.dart';
import 'package:foodcourt/core/viewmodel/meal_favorite_view_model.dart';
import 'package:foodcourt/ui/shared/size_fit.dart';
import 'package:foodcourt/ui/widgets/operation_item.dart';
import 'package:provider/provider.dart';

class FCMealItem extends StatelessWidget {
  final cardRadius = 12.px;

  final FCMealModel _model;

  FCMealItem(this._model);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardRadius)
        ),
        child: Column(
          children: <Widget>[
            buildBaseInfo(),
            buildOperationInfo()
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(FCRouter.detailPage, arguments: _model);
      },
    );
  }
  
  Widget buildBaseInfo() {
    return Stack(
      children: <Widget>[
        ClipRRect(
          child: Image.network(_model.imageUrl, width: double.infinity, height: 250.px, fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardRadius),
            topRight: Radius.circular(cardRadius),
          ),
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(vertical: 5.px, horizontal: 10.px),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6.px)
            ),
            child: Text(_model.title, style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        )
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0.px, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FCOperationItem(Icon(Icons.schedule), "${_model.duration}分钟"),
          FCOperationItem(Icon(Icons.restaurant), "${_model.complexityText}"),
          buildFavoriteItem()
        ],
      ),
    );
  }

  Widget buildFavoriteItem() {
    return Consumer<FCFavoriteViewModel> (
      builder: (context, vm, child) {
        final isFavorite = vm.isFavorite(_model);
        return GestureDetector(
          child: FCOperationItem(
            Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
            ),
            isFavorite ? "收藏" : "未收藏"
          ),
          onTap: () {
            vm.switchFavorite(_model);
          },
        );
      },
    );
  }
}
