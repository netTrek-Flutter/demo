import 'package:flutter/widgets.dart';

class CustomRoute {
  final Uri url;
  final Map<String, dynamic> params;
  final RouteHandler handler;

  CustomRoute({required this.url, required this.handler, Map<String, dynamic>? params}) : params = params?? {};
}

class CustomRouteBuilder {
  final Uri url;
  final Map<String, dynamic> params = {};

  CustomRouteBuilder(this.url);

  CustomRoute createCustomRoute(RouteHandler handler) {
    return CustomRoute(url: url, handler: handler, params: params);
  }

  CustomRouteBuilder addParams(Map<String, dynamic> toAdd) {
    params.addAll(toAdd);
    return this;
  }

  CustomRouteBuilder clone() {
    return CustomRouteBuilder(url).addParams(params);
  }
}

abstract class RouteHandler {
  Page buildPage(Map<String, dynamic> params);
}