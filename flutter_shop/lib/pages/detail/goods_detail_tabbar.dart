import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_shop/provider/goods_detail_provider.dart';
import 'package:flutter_shop/shared/shared.dart';

class GoodsDetailTabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsDetailProvider>(
        builder: (context, provider, child) {
          final isLeft = provider.isLeft;
          final isRight = provider.isRight;

          return Container(
            margin: EdgeInsets.only(top: 10.rpx),
            child: Row(
              children: <Widget>[
                _buildMyTabbarLeft(context, isLeft),
                _buildMyTabbarRight(context, isRight)
              ],
            )
          );
        }
    );
  }

  Widget _buildMyTabbarLeft(context, bool isLeft) {
    return Consumer<GoodsDetailProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10.rpx),
            alignment: Alignment.center,
            width: 375.rpx,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      width: 1.rpx,
                      color: isLeft ? Colors.pink : Colors.black12
                  )
              )
            ),
            child: Text(
              '详情',
              style: TextStyle(color: isLeft ? Colors.pink : Colors.black),
            ),
          ),
          onTap: () {
            provider.changeLeftOrRight('left');
          },
        );
      }
    );
  }

  Widget _buildMyTabbarRight(context, bool isRight) {
    return Consumer<GoodsDetailProvider>(
        builder: (context, provider, child) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10.rpx),
              alignment: Alignment.center,
              width: 375.rpx,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: 1.rpx,
                          color: isRight ? Colors.pink : Colors.black12
                      )
                  )
              ),
              child: Text(
                '评论',
                style: TextStyle(color: isRight ? Colors.pink : Colors.black),
              ),
            ),
            onTap: () {
              provider.changeLeftOrRight('right');
            },
          );
        }
    );
  }
}
