import 'package:flutter/material.dart';

class KKBottomBarItem extends BottomNavigationBarItem {
  KKBottomBarItem({
    String title,
    IconData icon,
  }) : super(
    title: Text(title),
    icon: Icon(icon),
    activeIcon: Icon(icon)
  );
}