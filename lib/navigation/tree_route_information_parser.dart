import 'package:flutter/widgets.dart';

import 'custom_route.dart';
import 'url_tree_node.dart';

class TreeRouteInformationParser extends RouteInformationParser<CustomRoute> {
  final UrlTreeNode routesTreeRoot;
  final CustomRoute error404;

  TreeRouteInformationParser(this.routesTreeRoot, this.error404);

  @override
  Future<CustomRoute> parseRouteInformation(
      RouteInformation routeInformation) async {
    return parseRouteInformationSync(routeInformation);
  }
  CustomRoute parseRouteInformationSync(RouteInformation routeInformation) {
    return routesTreeRoot
        .findCustomRoute(Uri.parse(routeInformation.location ?? '')) ??
        error404;
  }

  @override
  RouteInformation restoreRouteInformation(CustomRoute routeInfo) {
    return RouteInformation(location: routeInfo.url.path);
  }
}
