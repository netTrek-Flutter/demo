import 'package:flutter/material.dart';
import 'custom_route.dart';
import 'my_back_button_dispatcher.dart';
import 'tree_route_information_parser.dart';
import 'url_tree_node.dart';
import 'url_tree_node_with_parameter.dart';
import 'views/error_404.dart';
import 'views/home.dart';
import 'views/item.dart';
import 'views/items.dart';
import 'views/loading.dart';
import 'my_router_delegate.dart';

UrlTreeNode routesRoot = UrlTreeNode.root(
  HomeRouteHandler(),
  {
    ['items']: ItemsRouteHandler(),
    [
      'items',
      PathSegmentParameterConfig(
          type: int, pattern: r'[0-9]+', parameterName: 'itemId')
    ]: ItemRouteHandler(),
  },
);

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
      backButtonDispatcher: MyBackButtonDispatcher(),
    ),
  );
}
