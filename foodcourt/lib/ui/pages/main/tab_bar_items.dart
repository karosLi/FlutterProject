import 'package:flutter/material.dart';
import 'package:foodcourt/ui/pages/favorite/favorite.dart';
import 'package:foodcourt/ui/pages/home/home.dart';


final List<Widget> pages = [
  FCHomePage(),
  FCFavoritePage()
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    title: Text("首页"),
    icon: Icon(Icons.home)
  ),
  BottomNavigationBarItem(
    title: Text("收藏"),
    icon: Icon(Icons.favorite)
  )
];
