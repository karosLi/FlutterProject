import 'package:flutter/material.dart';

class FCAPPTheme {
  /// 共有属性
  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;

  /// 普通模式
  static final Color norTextColor = Colors.black;

  static final ThemeData theme = ThemeData(
    // 设置主题亮度
    brightness: Brightness.light,
    // 前景色 tintColor，包含了 primaryColor 和 accentColor
    primarySwatch: Colors.pink,
    // 单独设置 primaryColor：用于设置 导航 和 tabBar 颜色
    primaryColor: Colors.pink,
    // 单独设置 accentColor：用于设置 浮动按钮 和 switch 颜色
    accentColor: Colors.amber,
    // 页面默认背景颜色
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
    // 按钮主题
    buttonTheme: ButtonThemeData(
      height: 25,
      minWidth: 10,
      buttonColor: Colors.pink
    ),
    // card 主题
    cardTheme: CardTheme(
      shadowColor: Colors.black54,
      // 阴影长度
      elevation: 10
    ),
    // 文本主题
    textTheme: TextTheme(
      // 设置文本大小
      bodyText2: TextStyle(fontSize: normalFontSize, color: norTextColor),
    ),
  );

  /// 暗黑模式
  static final Color darkTextColor = Colors.red;
  static final ThemeData darkTheme = ThemeData(
    // 设置主题亮度
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    // 文本主题
    textTheme: TextTheme(
      // 设置文本大小
      bodyText2: TextStyle(fontSize: normalFontSize, color: darkTextColor),
    ),
  );
}