import 'package:flutter/material.dart';
import 'package:flutter_demo_project/navigation/custom_route.dart';
import 'package:flutter_demo_project/navigation/tree_route_information_parser.dart';
import 'package:flutter_demo_project/navigation/url_tree_node.dart';
import 'package:flutter_demo_project/navigation/url_tree_node_with_parameter.dart';
import 'package:flutter_demo_project/navigation/views/error_404.dart';
import 'package:flutter_demo_project/navigation/views/home.dart';
import 'package:flutter_demo_project/navigation/views/item.dart';
import 'package:flutter_demo_project/navigation/views/items.dart';

UrlTreeNode routesRoot = UrlTreeNode.root(
  HomeRouteHandler(),
    {
      ['items']: ItemsRouteHandler(),
      ['items', PathSegmentParameterConfig(type: int, pattern: r'[0-9]+', parameterName: 'itemId')]: ItemRouteHandler(),
    }
);

main() {
  runApp(
    MaterialApp.router(
      routeInformationParser: TreeRouteInformationParser(
        routesRoot,
        CustomRoute(
          url: Uri.parse('error/404'),
          handler: Error404RouteHandler(),
        ),
      ),
      routerDelegate: MyRouterDelegate(
        MaterialPage(
          child: CircularProgressIndicator(),
        ),
      ),
    ),
  );
}

class MyRouterDelegate extends RouterDelegate<CustomRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<CustomRoute> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Page _currentPage;

  MyRouterDelegate(Page loadingPage) : _currentPage = loadingPage;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [_currentPage],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;

        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(CustomRoute route) async {
    _currentPage = route.handler.buildPage(route.params);
  }
}
