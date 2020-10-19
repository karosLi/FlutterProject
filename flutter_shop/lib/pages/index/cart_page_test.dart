import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_shop/shared/shared.dart';

class CartPageTest extends StatelessWidget {
  ValueNotifier<List<String>> cartGoodsListNotifier = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    _show();
    return Scaffold(
      body: ValueListenableProvider<List<String>>.value(
        value: cartGoodsListNotifier,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Consumer<List<String>>(
                builder: (context, provider, child) {
                  return Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(provider[index]),
                        );
                      }
                    ),
                  );
                }
              ),
              RaisedButton(
                child: Text("增加"),
                onPressed: () {
                  _add();
                },
              ),
              RaisedButton(
                child: Text("清空"),
                onPressed: () {
                  _clear();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _add() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> list = cartGoodsListNotifier.value;
    list.add('的点点滴滴');

    List<String> newList = [];
    newList.addAll(list);

    preferences.setStringList("cartGoodsListTest", newList);
    cartGoodsListNotifier.value = newList;
  }

  void _show() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> list = preferences.getStringList("cartGoodsListTest");
    cartGoodsListNotifier.value = list ?? [];
  }

  void _clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("cartGoodsListTest");
    cartGoodsListNotifier.value = [];
  }
}
