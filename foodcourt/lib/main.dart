import 'package:flutter/material.dart';
import 'package:foodcourt/core/viewmodel/meal_favorite_view_model.dart';
import 'package:foodcourt/core/viewmodel/meal_view_model.dart';
import 'package:foodcourt/ui/shared/app_theme.dart';
import 'package:foodcourt/core/router/router.dart';
import 'package:foodcourt/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

main() {
  // 1、runApp 函数
  runApp(
    MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return FCMealViewModel();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return FCFavoriteViewModel();
          },
        ),
      ]
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeFit.init();

    return MaterialApp(
      title: "美食广场",
      debugShowCheckedModeBanner: false,

      // 主题
      theme: FCAPPTheme.theme,

      // 路由
      initialRoute: FCRouter.initialRoute,
      routes: FCRouter.routers,
      onGenerateRoute: FCRouter.generateRoute,
      onUnknownRoute: FCRouter.unknownRoute,
    );
  }
}


