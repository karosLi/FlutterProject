import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import '../home/home.dart';
import '../subject/subject.dart';

List<KKBottomBarItem> items = [
  KKBottomBarItem(title: "首页", icon: Icons.home),
  KKBottomBarItem(title: "书影音", icon: Icons.video_library),
  KKBottomBarItem(title: "小组", icon: Icons.group),
  KKBottomBarItem(title: "市集", icon: Icons.shopping_cart),
  KKBottomBarItem(title: "我的", icon: Icons.person),
];

List<Widget> pages = [
  KKHomePage(),
  KKSubjectPage(),
  KKSubjectPage(),
  KKSubjectPage(),
  KKSubjectPage(),
];
