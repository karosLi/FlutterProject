import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/model/category_goods_model.dart';
import 'package:flutter_shop/provider/category_provider.dart';
import 'package:flutter_shop/provider/child_category_provider.dart';
import 'package:flutter_shop/shared/shared.dart';
import 'package:flutter_shop/routers/application.dart';

class CategoryPage extends StatelessWidget {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('分类')),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<CategoryProvider>(create: (context) => CategoryProvider()..fetchContent()),
          ChangeNotifierProxyProvider<CategoryProvider, ChildCategoryProvider>(
            create: (context) {
              return ChildCategoryProvider();
            },
            update: (context, categoryProvider, childCategoryProvider) {
              if (childCategoryProvider.selectedCategoryIndex >= 0) {
                return childCategoryProvider;
              }

              // 第一次更新的时候，默认选中第一个
              return childCategoryProvider..selectCategory(categoryProvider.categoryModels.first, 0);
            }
          ),
        ],
        child: Container(
          child: Consumer<CategoryProvider>(
            builder: (context, provider, child) {
              if (provider.categoryModels.length == 0) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildLeftContainer(provider.categoryModels),
                  Expanded(child: _buildRightContainer()),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  /// 左侧分类列表
  Widget _buildLeftContainer(List<CategoryModel> list) {
    return Container(
      width: 180.rpx,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(width: 1.rpx, color: Colors.black12),
        )
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _buildLeftItem(list[index], index);
        }
      ),
    );
  }

  Widget _buildLeftItem(CategoryModel model, int index) {
    return Consumer<ChildCategoryProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          child: Container(
            height: 100.rpx,
            padding: EdgeInsets.only(left: 30.rpx),
            decoration: BoxDecoration(
                color: provider.selectedCategoryIndex == index ? Colors.black12 : Colors.white,
                border: Border(
                    bottom: BorderSide(width: 1.rpx, color: Colors.black12)
                )
            ),
            child: Text(model.mallCategoryName),
            alignment: Alignment.centerLeft,
          ),
          onTap: () {
            _refreshController.refreshCompleted(resetFooterState: true);
            provider.selectCategory(model, index);
          },
        );
      },
    );
  }

  /// 右侧容器
  Widget _buildRightContainer() {
    return Consumer<ChildCategoryProvider>(
      builder: (context, provider, child) {
        if (provider.categoryGoodsModels == null) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }

        return Column(
          children: <Widget>[
            _buildRightTitleContainer(provider.selectedCategory),
            _buildRightGoodsListContainer()
          ],
        );
      },
    );
  }

  /// 子分类
  Widget _buildRightTitleContainer(CategoryModel selectedCategory) {
    return Container(
      height: 80.rpx,
      padding: EdgeInsets.only(left: 20.rpx),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(width: 1.rpx, color: Colors.black12)
        )
      ),
      child: ListView.builder(
        controller: ScrollController(),
        scrollDirection: Axis.horizontal,
        itemCount: selectedCategory.bxMallSubDto.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            BxMallSubDto all = BxMallSubDto();
            all.mallCategoryId = selectedCategory.mallCategoryId;
            all.mallSubId = '0';
            all.mallSubName = '全部';
            return _buildRightTitleItem(0);
          }

          return _buildRightTitleItem(index);
        }
      ),
    );
  }

  Widget _buildRightTitleItem(int index) {
    return Consumer<ChildCategoryProvider>(
      builder: (context, provider, child) {
        BxMallSubDto item;
        if (index == 0) {
          BxMallSubDto all = BxMallSubDto();
          all.mallCategoryId = provider.selectedCategory.mallCategoryId;
          all.mallSubId = '0';
          all.mallSubName = '全部';
          item = all;
        } else {
          item = provider.selectedCategory.bxMallSubDto[index - 1];
        }
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.fromLTRB(5.0.rpx, 0, 5.0.rpx, 0),
            alignment: Alignment.center,
            child: Text(
              item.mallSubName,
              style: TextStyle(fontSize: 28.rpx, color: provider.selectedSubCategoryIndex == index ? Colors.pink : Colors.black),
            ),
          ),
          onTap: () {
//            _scrollController.animateTo(0, duration: Duration(milliseconds: 0), curve: Curves.ease);
            _refreshController.refreshCompleted(resetFooterState: true);
            provider.selectSubCategory(item, index);
          },
        );
      }
    );
  }

  /// 商品列表
  Widget _buildRightGoodsListContainer() {
    return Consumer<ChildCategoryProvider>(
      builder: (context, provider, child) {
        if (provider.categoryGoodsModels.length == 0) {
          return Expanded(
            child: Center(
              child: Text('暂时没有该类商品'),
            ),
          );
        }

        return Expanded(
          child: Container(
            color: Colors.white,
            child: SmartRefresher(/// 上拉加载更多
              controller: _refreshController,
              enablePullDown: false,
              enablePullUp: true,
              onRefresh: () async {
                await provider.loadMore();
                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                await provider.loadMore();
                if (provider.hasNoMoreCategoryGoodsModels) {
                  _refreshController.loadNoData();
                } else {
                  _refreshController.loadComplete();
                }
              },
              child: ListView.builder(
//                controller: _scrollController,
                scrollDirection: Axis.vertical,
                itemCount: provider.categoryGoodsModels.length,
                itemBuilder: (context, index) {
                  CategoryGoodsModel model = provider.categoryGoodsModels[index];
                  return _buildRightGoodsItemContainer(context, model);
                }
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildRightGoodsItemContainer(context, CategoryGoodsModel model) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(top: 5.rpx, bottom: 5.rpx, right: 20.rpx),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 1.rpx, color: Colors.black12)
            )
        ),
        child: Row(
          children: <Widget>[
            _buildRightGoodsImage(model),
            SizedBox(width: 16.rpx),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildRightGoodsTitle(model),
                  _buildRightGoodsPrice(model)
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Application.router.navigateTo(context, '/detail?id=${model.goodsId}');
      },
    );
  }

  Widget _buildRightGoodsImage(CategoryGoodsModel model) {
    return CachedNetworkImage(
      width: 200.rpx,
      imageUrl: model.image,
      fit: BoxFit.cover,
    );
  }

  Widget _buildRightGoodsTitle(CategoryGoodsModel model) {
    return Container(
      padding: EdgeInsets.all(5.0.rpx),
      child: Text(model.goodsName, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 28.rpx)),
    );
  }

  Widget _buildRightGoodsPrice(CategoryGoodsModel model) {
    return Container(
      margin: EdgeInsets.only(top: 20.rpx),
      child: Row(
        children: <Widget>[
          Text('价格：￥${model.presentPrice}', style: TextStyle(color: Colors.pink, fontSize: 30.rpx),),
          Text('￥${model.oriPrice}', style: TextStyle(color: Colors.black26, fontSize: 20.rpx, decoration: TextDecoration.lineThrough))
        ],
      ),
    );
  }
}

