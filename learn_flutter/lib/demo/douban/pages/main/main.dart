import 'package:flutter/material.dart';
import 'package:learn_flutter/demo/douban/pages/main/initial_items.dart';
import 'initial_items.dart';

class KKMainPage extends StatefulWidget {
  @override
  _KKMainPageState createState() => _KKMainPageState();
}

class _KKMainPageState extends State<KKMainPage> {
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
        type: BottomNavigationBarType.fixed,
        items: items,
        unselectedFontSize: 14,
        selectedFontSize: 14,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
