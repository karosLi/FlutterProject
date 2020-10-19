import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> _bottomTabs = [
    BottomNavigationBarItem(
      title: Text("首页"),
      icon: Icon(CupertinoIcons.home)
    ),
    BottomNavigationBarItem(
        title: Text("分类"),
        icon: Icon(CupertinoIcons.search)
    ),
    BottomNavigationBarItem(
        title: Text("购物车"),
        icon: Icon(CupertinoIcons.shopping_cart)
    ),
    BottomNavigationBarItem(
        title: Text("会员中心"),
        icon: Icon(CupertinoIcons.profile_circled)
    ),
  ];

  final List<Widget> _tabPages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _tabPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomTabs,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
