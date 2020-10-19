import 'dart:math';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_shop/model/home_model.dart';
import 'package:flutter_shop/model/home_hot_model.dart';
import 'package:flutter_shop/provider/home_provider.dart';
import 'package:flutter_shop/shared/shared.dart';

class HomePage extends StatelessWidget {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider()..fetchContent(),
      child: Scaffold(
        appBar: AppBar(title: Text('美好人间')),
        body: Container(
          child: Consumer<HomeProvider>(
            builder: (context, provider, child) {
              if (provider.model == null) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }

              List<Widget> widgets = [];
              if (provider.model.slides != null) {
                widgets.add(SwiperDiy(swiperDateList: provider.model.slides));
              }
              if (provider.model.category != null) {
                widgets.add(BoothListWidget(categoryList: provider.model.category));
              }
              if (provider.model.advertesPicture != null) {
                widgets.add(ADBanner(pic: provider.model.advertesPicture.pictureAddress));
              }
              if (provider.model.shopInfo != null) {
                widgets.add(StoreManager(pic: provider.model.shopInfo.leaderImage, phone: provider.model.shopInfo.leaderPhone));
              }

              widgets.add(SizedBox(height: 8.px,));
              if (provider.model.recommend != null) {
                widgets.add(RecommendWidget(recommendList: provider.model.recommend));
              }
              if (provider.model.floor1Pic.pictureAddress != null) {
                widgets.add(FloorTitleWidget(imageUrl: provider.model.floor1Pic.pictureAddress));
              }
              if (provider.model.floor1 != null) {
                widgets.add(FloorContentWidget(floorGoodsList: provider.model.floor1));
              }
              if (provider.model.floor2Pic.pictureAddress != null) {
                widgets.add(FloorTitleWidget(imageUrl: provider.model.floor2Pic.pictureAddress));
              }
              if (provider.model.floor2 != null) {
                widgets.add(FloorContentWidget(floorGoodsList: provider.model.floor2));
              }
              if (provider.model.floor3Pic.pictureAddress != null) {
                widgets.add(FloorTitleWidget(imageUrl: provider.model.floor3Pic.pictureAddress));
              }
              if (provider.model.floor3 != null) {
                widgets.add(FloorContentWidget(floorGoodsList: provider.model.floor3));
              }
              if (provider.hotModels != null) {
                widgets.add(HotGoodsTitleWidget());
                widgets.add(HotGoodsWidget(provider.hotModels));
              }


              return SmartRefresher(
                controller: _refreshController,
                enablePullUp: true,
                child: SingleChildScrollView(
                  child: Column(
                    children: widgets,
                  ),
                ),
                onRefresh: () async {
                  await provider.fetchContent();
                  _refreshController.refreshCompleted();
                },
                onLoading: () async {
                  await provider.loadMore();
                  if (provider.hasNoMoreHotModels) {
                    _refreshController.loadNoData();
                  } else {
                    _refreshController.loadComplete();
                  }

                }
              );
            },
          ),
        )
      ),
    );
  }
}

class SwiperDiy extends StatelessWidget {
  final List<Slide> swiperDateList;
  SwiperDiy({Key key, this.swiperDateList}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.px,
      child: Swiper(
        itemCount: swiperDateList.length,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: '${swiperDateList[index].image}',
            fit: BoxFit.cover,
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

class BoothListWidget extends StatelessWidget {
  final List<Category> categoryList;
  BoothListWidget({Key key, this.categoryList}): super(key: key);

  @override
  Widget build(BuildContext context) {
//    https://stackoverflow.com/questions/48405123/how-to-set-custom-height-for-widget-in-gridview-in-flutter
    var width = MediaQuery.of(context).size.width;
    var columns = 5;
    var columnWidth = width / columns;
    var aspectRatio = columnWidth / 70.px;

    return GridView.builder(
      shrinkWrap: true,
      // 视图不滚动
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 20.px),
      itemCount: min(categoryList.length, 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // 指定一行有几列
        crossAxisCount: 5,
        // 宽高比
        childAspectRatio: aspectRatio,
        // 行间距
        mainAxisSpacing: 6.px,
        // 列间距
        crossAxisSpacing: 0
      ),
      itemBuilder: (BuildContext context, int index) {
        return _buildBoothItem(categoryList[index]);
      }
    );
  }

  Widget _buildBoothItem(Category category) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: category.image,
          fit: BoxFit.cover,
          width: 45.px,
        ),
        Text(category.mallCategoryName)
      ],
    );
  }
}

class ADBanner extends StatelessWidget {
  final String pic;
  ADBanner({Key key, this.pic}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: pic,
        fit: BoxFit.cover,
      ),
    );
  }
}

class StoreManager extends StatelessWidget {
  final String pic;
  final String phone;
  StoreManager({Key key, this.pic, this.phone}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: CachedNetworkImage(
          imageUrl: pic,
          fit: BoxFit.cover,
        ),
        onTap: _launchUrl,
      ),
    );
  }

  void _launchUrl() async {
    var url = 'tel:$phone';
    var can = await canLaunch(url);
    if (can) {
      launch(url);
    }
  }
}

/// 推荐
class RecommendWidget extends StatelessWidget {
  final List<Recommend> recommendList;
  RecommendWidget({Key key, this.recommendList}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(10.px, 5.px, 0, 5.px),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 1.rpx,
                  color: Colors.black12
                )
              )
            ),
            child: Text('商品推荐', style: TextStyle(color: Colors.pink)),
          ),
          _buildList()
        ],
      ),
    );
  }

  Widget _buildList() {
    return Container(
      height: 230.px,
      child: ListView.builder(
        // 高度由内容包裹计算得来
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _buildItem(recommendList[index]);
        }
      ),
    );
  }

  Widget _buildItem(Recommend item) {
    return Container(
      width: 180.px,
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            width: 1.rpx,
            color: Colors.black12
          ),
          bottom: BorderSide(
            width: 1.rpx,
            color: Colors.black12
          )
        )
      ),
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: item.image,
            fit: BoxFit.cover,
          ),
          Text('￥${item.mallPrice}'),
          Text('￥${item.price}',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}

/// 楼层
class FloorTitleWidget extends StatelessWidget {
  final String imageUrl;
  FloorTitleWidget({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(imageUrl),
    );
  }
}

class FloorContentWidget extends StatelessWidget {
  final List<Floor> floorGoodsList;

  FloorContentWidget({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _otherGoods()
        ],
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _buildGoodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _buildGoodsItem(floorGoodsList[1]),
            _buildGoodsItem(floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _buildGoodsItem(floorGoodsList[3]),
        _buildGoodsItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _buildGoodsItem(Floor goods) {
    return Container(
      width: 375.rpx,
      child: GestureDetector(
        child: CachedNetworkImage(
          imageUrl: goods.image,
          fit: BoxFit.cover,
        ),
        onTap: () {
          print('${goods.goodsId}');
        },
      ),
    );
  }
}

/// 火爆商品
class HotGoodsTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.px),
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Text('火爆专区')
    );
  }
}

class HotGoodsWidget extends StatelessWidget {
  final List<HomeHotModel> models;
  HotGoodsWidget(this.models);

  @override
  Widget build(BuildContext context) {
    print('=========== ${models.length}');
    var width = MediaQuery.of(context).size.width;
    var columns = 2;
    var columnWidth = width / columns;
    var aspectRatio = columnWidth / 250.px;

    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        // 视图不滚动
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20.px),
        itemCount: models.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 指定一行有几列
          crossAxisCount: 2,
          // 宽高比
          childAspectRatio: aspectRatio,
          // 行间距
          mainAxisSpacing: 3.px,
          // 列间距
          crossAxisSpacing: 3.px,
        ),
        itemBuilder: (BuildContext context, int index) {
          return HotGoodsItemWidget(models[index]);
        }
      ),
    );
  }
}

class HotGoodsItemWidget extends StatelessWidget {
  final HomeHotModel model;
  HotGoodsItemWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 372.rpx,
        color: Colors.white,
        padding: EdgeInsets.all(5.px),
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: model.image,
              fit: BoxFit.cover,
              width: 370.rpx,
            ),
            Text(model.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.pink, fontSize: 20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('￥${model.mallPrice}'),
                Text('￥${model.price}', style: TextStyle(color: Colors.black26, decoration: TextDecoration.lineThrough),),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Application.router.navigateTo(context, '/detail?id=${model.goodsId}', transition: TransitionType.inFromLeft);
      },
    );
  }
}








