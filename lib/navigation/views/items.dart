import 'package:flutter/material.dart';
import 'package:flutter_demo_project/navigation/custom_route.dart';

import '../my_router_delegate.dart';

class ItemsRouteHandler extends RouteHandler {
  @override
  Page buildPage(
      Map<String, dynamic> routeParams, Map<String, String> queryParams) {
    return MaterialPage(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Items'),
        ),
        body: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Text(
                'Items',
                textAlign: TextAlign.center,
              ),
              Spacer(),
              TextButton(
                  onPressed: () =>
                      MyRouterDelegate.navigateToUrl(context, '/items/1'),
                  child: Text('Show first')),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
