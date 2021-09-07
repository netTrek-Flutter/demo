import 'custom_route.dart';
import 'url_tree_node_with_parameter.dart';
import 'url_tree_node_without_parameter.dart';

bool matchesFullString(RegExp regex, String str) {
  var match = regex.matchAsPrefix(str);
  return match != null && match.start == 0 && match.end == str.length;
}

abstract class UrlTreeNode {
  final RegExp pattern;
  final RouteHandler routeHandler;
  final List<UrlTreeNode> children = [];

  UrlTreeNode({required String pattern, required handler})
      : pattern = RegExp(pattern),
        routeHandler = handler;

  factory UrlTreeNode.root(RouteHandler handler,
      [Map<List<dynamic>, RouteHandler>? routes]) {
    var root = UrlTreeNodeWithoutParameter(pattern: '', handler: handler);

    if (routes != null) {
      routes.forEach((key, value) => root.add(urlPath: key, handler: value));
    }

    return root;
  }

  factory UrlTreeNode.fromDynamic(
      {required dynamic args, required RouteHandler handler}) {
    assert(args != null);
    assert(args is String || args is PathSegmentParameterConfig);

    return args is String
        ? UrlTreeNodeWithoutParameter(pattern: args, handler: handler)
        : UrlTreeNodeWithParameter(config: args, handler: handler);
  }

  List<UrlTreeNode> _findChildren(String query) {
    return children.where((child) => matchesFullString(child.pattern, query)).toList();
  }

  UrlTreeNode? _findChildByPattern(String pattern) {
    if (children.isEmpty) return null;
    return children.firstWhere((child) => child.pattern.pattern == pattern);
  }

  void add({required List<dynamic> urlPath, required RouteHandler handler}) {
    assert(urlPath.isNotEmpty);
    assert(
        urlPath.first is PathSegmentParameterConfig || urlPath.first is String);

    var matchingChild = _findChildByPattern(urlPath.first is String? urlPath.first : urlPath.first.pattern);
    if (matchingChild == null) {
      matchingChild =
          UrlTreeNode.fromDynamic(args: urlPath.first, handler: handler);
      children.add(matchingChild);
    }

    urlPath.removeAt(0);

    if (urlPath.isNotEmpty)
      matchingChild.add(urlPath: urlPath, handler: handler);
  }

  CustomRoute? findCustomRoute(Uri uri) {
    return _findCustomRoute(CustomRouteBuilder(uri), '', uri.pathSegments.toList());
  }

  CustomRoute? _findCustomRoute(CustomRouteBuilder routeBuilder,
      String mySegment, List<String> followingPath) {
    handleParams(mySegment, routeBuilder);

    if (followingPath.isEmpty) {
      return routeBuilder.createCustomRoute(routeHandler);
    } else {
      var nextSegment = followingPath.removeAt(0);
      var matchingChildren = _findChildren(nextSegment);

      if (matchingChildren.isEmpty) return null;

      for (var child in matchingChildren) {
        var childRoute = child._findCustomRoute(
            routeBuilder.clone(), nextSegment, followingPath);
        if (childRoute != null) return childRoute;
      }
    }
  }

  void handleParams(String pathSegment, CustomRouteBuilder routeBuilder);
}
