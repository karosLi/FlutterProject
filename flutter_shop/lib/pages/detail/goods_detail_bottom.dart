import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:flutter_shop/model/goods_detail_model.dart';
import 'package:flutter_shop/provider/goods_detail_provider.dart';
import 'package:flutter_shop/provider/cart_provider.dart';
import 'package:flutter_shop/shared/shared.dart';

class GoodsDetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<GoodsDetailProvider, CartProvider>(
      builder: (context, goodsProvider, cartProvider, child) {
        return Container(
          width: double.infinity,
          color: Colors.white,
          height: 100.rpx,
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 110.rpx,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Icon(Icons.shopping_cart, size: 35, color: Colors.red),
                ),
                onTap: () {

                },
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40.rpx)
                    ),
                    height: 80.rpx,
                    alignment: Alignment.center,
                    child: Text('加入购物车', style: TextStyle(color: Colors.white, fontSize: 28.rsp),),
                  ),
                  onTap: () {
                    cartProvider.addToCart(goodsProvider.model.goodInfo, 1);
                  },
                ),
              ),
              SizedBox(width: 10.rpx,),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(40.rpx)
                    ),
                    height: 80.rpx,
                    alignment: Alignment.center,
                    child: Text('立即购买', style: TextStyle(color: Colors.white, fontSize: 28.rsp),),
                  ),
                  onTap: () {

                  },
                ),
              ),
              SizedBox(width: 16,),
            ],
          ),
        );
      },
    );
  }
}
