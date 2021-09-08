import 'package:flutter/material.dart';
import 'package:flutter_demo_project/navigation/custom_route.dart';
import 'package:flutter_demo_project/navigation/link_tree_navigator.dart';

class ItemsRouteHandler extends RouteHandler {
  @override
  Page buildPage(Map<String, dynamic> routeParams, Map<String, String> queryParams) {
    return MaterialPage(
      child: Builder(
        builder: (context) => Column(
          children: [
            Spacer(),
            Text('Items'),
            Spacer(),
            TextButton(
                onPressed: () => MyRouterDelegate.navigateToUrl(context, '/items/1'),
                child: Text('Show first')),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
