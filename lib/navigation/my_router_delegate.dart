import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_route.dart';
import 'tree_route_information_parser.dart';
import 'url_tree_node.dart';

class MyRouterDelegate extends RouterDelegate<CustomRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<CustomRoute> {
  static late final MyRouterDelegate _instance;

    static void navigateToUrl(BuildContext context, String url) {
    _instance._navigateToUrl(context, url);
  }

  static Future<bool> popRouteOnInstance() {
    return _instance.popRoute();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final TreeRouteInformationParser routeInformationParser;

  final UrlTreeNode routesTreeRoot;

  CustomRoute _currentRoute;
  List<Page> _pages = [];

  MyRouterDelegate(this.routeInformationParser, CustomRoute loadingPage)
      : routesTreeRoot = routeInformationParser.routesTreeRoot,
        _currentRoute = loadingPage {
    _instance = this;
  }

  @override
  Widget build(BuildContext context) {
    _pages.insert(0, _currentRoute.buildRoute());

    return Navigator(
      key: navigatorKey,
      pages: _pages.reversed.toList(),
      onPopPage: (route, result) {
        log('opp');
        return !route.didPop(result) && _pages.length <= 1;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(CustomRoute route) async {
    _currentRoute = route;
  }

  void _navigateToUrl(BuildContext context, String url) {
    Router.navigate(context, () {
      SystemNavigator.routeInformationUpdated(location: url);
      setNewRoutePath(routeInformationParser.parseRouteInformationSync(RouteInformation(location: url)));
    });
    notifyListeners();
  }
}
