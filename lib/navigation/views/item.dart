import 'package:flutter/material.dart';
import 'package:flutter_demo_project/navigation/custom_route.dart';

class ItemRouteHandler extends RouteHandler {
  @override
  Page buildPage(
      Map<String, dynamic> routeParams, Map<String, String> queryParams) {
    return MaterialPage(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Item'),
        ),
        body: Center(
          child: Text('Item ${routeParams['itemId']}'),
        ),
      ),
    );
  }
}
