import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:flutter_shop/model/goods_detail_model.dart';
import 'package:flutter_shop/provider/goods_detail_provider.dart';
import 'package:flutter_shop/shared/shared.dart';

class GoodsDetailWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsDetailProvider>(
        builder: (context, provider, child) {
          if (provider.isLeft) {
            return Container(
                child: Html(
                  data: provider.model.goodInfo.goodsDetail,
                )
            );
          }

          return Container(
            width: double.infinity,
            height: 300.rpx,
            padding: EdgeInsets.all(10.rpx),
            alignment: Alignment.center,
            child: Text('暂无评论'),
          );
        }
    );
  }
}
