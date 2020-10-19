import 'package:flutter/material.dart';
import 'package:foodcourt/ui/pages/home/drawer.dart';
import 'package:foodcourt/ui/pages/main/tab_bar_items.dart';


class FCMainScreen extends StatefulWidget {
  static const String routeName = "/";

  @override
  _FCMainScreenState createState() => _FCMainScreenState();
}

class _FCMainScreenState extends State<FCMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedFontSize: 14,
        unselectedFontSize: 14,
      ),
      drawer: FCHomeDrawer(),
    );
  }
}
