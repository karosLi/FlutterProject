import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_shop/model/goods_detail_model.dart';
import 'package:flutter_shop/provider/goods_detail_provider.dart';
import 'package:flutter_shop/shared/shared.dart';

class GoodsDetailTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsDetailProvider>(
      builder: (context, provider, child) {
        return Container(
          child: Column(
            children: <Widget>[
              _buildGoodsImage(provider.model.goodInfo.image1),
              _buildGoodsName(provider.model.goodInfo.goodsName),
              _buildGoodsNum(provider.model.goodInfo.goodsSerialNumber),
              _buildGoodsDesc()
            ],
          )
        );
      }
    );
  }

  /// 商品图片
  Widget _buildGoodsImage(url) {
    return CachedNetworkImage(
      height: 740.rpx,
      imageUrl: url,
      fit: BoxFit.cover,
    );
  }

  /// 商品名称
  Widget _buildGoodsName(name) {
    return Container(
      width: 740.rpx,
      padding: EdgeInsets.only(left: 15.rpx),
      color: Colors.white,
      child: Text(
        name,
        style: TextStyle(fontSize: 30.rsp),
      ),
    );
  }

  /// 商品编号
  Widget _buildGoodsNum(num) {
    return Container(
      width: 750.rpx,
      padding: EdgeInsets.only(left: 20.rpx, top: 8.rpx),
      color: Colors.white,
      child: Text(
        '编号： $num',
        style: TextStyle(color: Colors.black12, fontSize: 30.rsp),
      ),
    );
  }

  /// 商品说明
  Widget _buildGoodsDesc() {
    return Container(
      color: Colors.white,
      width: 750.rpx,
      margin: EdgeInsets.only(top: 10.rpx),
      padding: EdgeInsets.all(10.rpx),
      child: Text(
        '说明：> 急速送达 > 正品保证',
        style: TextStyle(color: Colors.red, fontSize: 30.rsp),
      ),
    );
  }
}

