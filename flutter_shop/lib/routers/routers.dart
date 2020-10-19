import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'application.dart';
import '../pages/detail/goods_detail_page.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static void configureRoutes(Router router) {
    Application.router = router;

    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
        print('ERROR: Route was not found');
        return Container();
      }
    );

    router.define(detailsPage, handler: Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
          String goodsId = parameters['id'].first;
          return GoodsDetailPage(goodsId: goodsId);
        }
    ));
  }
}