import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/cart_info_model.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_shop/provider/cart_provider.dart';
import 'package:flutter_shop/shared/shared.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('美好人间')),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.cartGoodsList.length == 0) {
            return Center(
              child: Text("购物车是空的哦~"),
            );
          }

          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: cartProvider.cartGoodsList.length,
                    itemBuilder: (context, index) {
                      return _buildCartItem(cartProvider, cartProvider.cartGoodsList[index]);
                    }
                ),
              ),
              _buildBottom(cartProvider)
            ],
          );
        }
      )
    );
  }

  Widget _buildCartItem(CartProvider cartProvider, CartInfoModel cartInfo) {
    return Container(
      margin: EdgeInsets.only(left: 5, top: 2, bottom: 5, right: 2),
      padding: EdgeInsets.only(left: 5, top: 10, bottom: 10, right: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: Row(
        children: <Widget>[
          _buildCheckButton(cartProvider, cartInfo),
          _buildImage(cartInfo),
          _buildName(cartProvider, cartInfo),
          _buildPrice(cartProvider, cartInfo),
        ],
      ),
    );
  }

  Widget _buildCheckButton(CartProvider cartProvider, CartInfoModel cartInfo) {
    return Container(
      child: Checkbox(
        value: cartInfo.isCheck,
        activeColor: Colors.pink,
        onChanged: (bool val) {
          cartProvider.switchItemCheck(cartInfo);
        },
      ),
    );
  }

  Widget _buildImage(CartInfoModel cartInfo) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black12)
      ),
      child: CachedNetworkImage(
        imageUrl: cartInfo.images,
        fit: BoxFit.cover,
        width: 150.rpx,
      ),
    );
  }

  Widget _buildName(CartProvider cartProvider, CartInfoModel cartInfo) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(cartInfo.goodsName),
            _buildCartCount(cartProvider, cartInfo)
          ],
        ),
      ),
    );
  }

  Widget _buildPrice(CartProvider cartProvider, CartInfoModel cartInfo) {
    return Container(
      width: 150.rpx,
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text("￥${cartInfo.price}"),
          Container(
            child: GestureDetector(
              child: Icon(Icons.delete_forever, color: Colors.black26, size: 30,),
              onTap: () {
                cartProvider.removeItem(cartInfo);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottom(CartProvider cartProvider) {
    return Container(
      height: 140.rpx,
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: cartProvider.allCheck,
                  activeColor: Colors.pink,
                  onChanged: (bool val) {
                    cartProvider.switchAllItemCheck(val);
                  },
                ),
                Text("全选")
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("合计：", style: TextStyle(fontSize: 36.rsp),),
                      Text("￥ ${cartProvider.totalPrice}", style: TextStyle(fontSize: 36.rsp, color: Colors.red),)
                    ],
                  ),
                  Text("满10元免配送费，预购免配送费", style: TextStyle(fontSize: 22.rsp, color: Colors.black38))
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text("结算(${cartProvider.totalCount})", style: TextStyle(color: Colors.white, fontSize: 22.rsp),),
            ),
            onTap: () {

            },
          )
        ],
      ),
    );
  }

  Widget _buildCartCount(CartProvider cartProvider, CartInfoModel cartInfo) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.black12)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            child: Container(
              width: 45.rpx,
              height: 45.rpx,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      right: BorderSide(width: 1, color: Colors.black12)
                  )
              ),
              child: Text("-", style: TextStyle(color: cartInfo.count <= 1 ? Colors.black26 : Colors.black),),
            ),
            onTap: () {
              if (cartInfo.count <= 1) {
                return;
              }
              cartProvider.updateIemCount(cartInfo, -1);
            },
          ),
          Container(
            width: 60.rpx,
            height: 45.rpx,
            color: Colors.white,
            alignment: Alignment.center,
            child: Text("${cartInfo.count}"),
          ),
          GestureDetector(
            child: Container(
              width: 45.rpx,
              height: 45.rpx,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      left: BorderSide(width: 1, color: Colors.black12)
                  )
              ),
              child: Text("+"),
            ),
            onTap: () {
              cartProvider.updateIemCount(cartInfo, 1);
            },
          )
        ],
      ),
    );
  }
}
