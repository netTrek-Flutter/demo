import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_project/navigation/custom_route.dart';
import 'package:flutter_demo_project/navigation/tree_route_information_parser.dart';
import 'package:flutter_demo_project/navigation/url_tree_node.dart';
import 'package:flutter_demo_project/navigation/url_tree_node_with_parameter.dart';
import 'package:flutter_demo_project/navigation/views/error_404.dart';
import 'package:flutter_demo_project/navigation/views/home.dart';
import 'package:flutter_demo_project/navigation/views/item.dart';
import 'package:flutter_demo_project/navigation/views/items.dart';
import 'package:flutter_demo_project/navigation/views/loading.dart';

UrlTreeNode routesRoot = UrlTreeNode.root(HomeRouteHandler(), {
  ['items']: ItemsRouteHandler(),
  [
    'items',
    PathSegmentParameterConfig(
        type: int, pattern: r'[0-9]+', parameterName: 'itemId')
  ]: ItemRouteHandler(),
});

main() {
  var routeInformationParser = TreeRouteInformationParser(
    routesRoot,
    CustomRoute(
      url: Uri.parse('error/404'),
      handler: Error404RouteHandler(),
    ),
  );
  runApp(
    MaterialApp.router(
      theme: ThemeData.light(),
      routeInformationParser: routeInformationParser,
      routerDelegate: MyRouterDelegate(
        routeInformationParser,
        CustomRoute(
          url: Uri.parse(''),
          handler: LoadingRouteHandler(),
        ),
      ),
    ),
  );
}

class MyRouterDelegate extends RouterDelegate<CustomRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<CustomRoute> {
  static void navigateToUrl(BuildContext context, String url) {
    var routerDelegate = Router.of(context).routerDelegate;
    assert(routerDelegate is MyRouterDelegate);
    (routerDelegate as MyRouterDelegate)._navigateToUrl(context, url);
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final TreeRouteInformationParser routeInformationParser;

  final UrlTreeNode routesTreeRoot;

  CustomRoute _currentRoute;

  MyRouterDelegate(this.routeInformationParser, CustomRoute loadingPage)
      : routesTreeRoot = routeInformationParser.routesTreeRoot,
        _currentRoute = loadingPage;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        _currentRoute.handler.buildPage(
          _currentRoute.params,
          _currentRoute.url.queryParameters
        ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;

        notifyListeners();
        return true;
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
