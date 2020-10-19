import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_shop/model/goods_detail_model.dart';
import 'package:flutter_shop/provider/goods_detail_provider.dart';
import 'package:flutter_shop/shared/shared.dart';
import 'goods_detail_top_area.dart';
import 'goods_detail_tabbar.dart';
import 'goods_detail_web.dart';
import 'goods_detail_bottom.dart';

class GoodsDetailPage extends StatelessWidget {
  final String goodsId;
  GoodsDetailPage({this.goodsId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoodsDetailProvider(goodsId)..fetchGoodsDetail(),
      child: Consumer<GoodsDetailProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(title: Text(provider.model == null ? '商品详情' : provider.model.goodInfo.goodsName)),
            body: Container(
              color: Colors.white,
              child: provider.model == null ?
              Center(
                child: CupertinoActivityIndicator(),
              ) :
              SafeArea(
                child: Container(
                  margin: EdgeInsets.zero,
                  child: Stack(
                    children: <Widget>[
                      ListView(
                        children: <Widget>[
                          GoodsDetailTopArea(),
                          GoodsDetailTabbar(),
                          GoodsDetailWeb(),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: GoodsDetailBottom(),
                      )
                    ],
                  ),
                ),
              )
            ),
          );
        }
      ),
    );
  }
}
