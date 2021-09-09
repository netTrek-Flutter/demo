import 'package:flutter/material.dart';
import 'package:flutter_demo_project/navigation/custom_route.dart';

class Error404RouteHandler extends RouteHandler {
  @override
  Page buildPage(
      Map<String, dynamic> routeParams, Map<String, String> queryParams) {
    return MaterialPage(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Error 404'),
        ),
        body: Center(
          child: Text('Error 404'),
        ),
      ),
    );
  }
}
