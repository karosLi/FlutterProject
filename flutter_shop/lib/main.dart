import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:fluro/fluro.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_shop/routers/routers.dart';
import 'package:flutter_shop/pages/index/index_page.dart';
import 'package:flutter_shop/shared/size_fit.dart';

import 'package:flutter_shop/provider/cart_provider.dart';

main() {
  SizeFit.init();
  // ignore: invalid_use_of_visible_for_testing_member
  /// 测试的时候，只要重启 app，持久化数据就会丢失，所以这里可以 mock 一些初始化数据
  SharedPreferences.setMockInitialValues({});
  
  // 1、runApp 函数
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 初始化路由
    final router = Router();
    Routes.configureRoutes(router);

    /// 全局配置子树下的SmartRefresher,下面列举几个特别重要的属性
    return RefreshConfiguration(
        headerBuilder: () => WaterDropHeader(
          complete: Text('加载完成', style: TextStyle(color: Colors.black54),),
        ),        // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
        footerBuilder:  () => ClassicFooter(
          idleText: '上拉加载更多',
          canLoadingText: '松手，加载更多',
          loadingText: '正在加载中',
          noDataText: '我是有底线的~',
        ),        // 配置默认底部指示器
        headerTriggerDistance: 80.0,        // 头部触发刷新的越界距离
        springDescription:SpringDescription(stiffness: 170, damping: 16, mass: 1.9),         // 自定义回弹动画,三个属性值意义请查询flutter api
        maxOverScrollExtent :100, //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
        maxUnderScrollExtent:0, // 底部最大可以拖动的范围
        enableScrollWhenRefreshCompleted: true, //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
        enableLoadingWhenFailed : false, //在加载失败的状态下, true 可以让用户仍然可以通过手势上拉来触发加载更多
        hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
        enableBallisticLoad: false, // true 可以通过惯性滑动触发加载更多
        child: MultiProvider(
          providers: [
            /// 全局购物车
            ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider()),
          ],
          child: MaterialApp(
            title: '百姓生活+',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.pink,
                canvasColor: Color.fromRGBO(244, 245, 245, 1.0)
            ),
            home: IndexPage(),
            onGenerateRoute: router.generator,// 设置路由
          ),
        ),
    );
  }
}


