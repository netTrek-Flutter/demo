import 'package:flutter/material.dart';
import 'package:flutter_demo_project/navigation/custom_route.dart';

class Error404RouteHandler extends RouteHandler {
  @override
  Page buildPage(Map<String, dynamic> params) {
    return MaterialPage(
      child: Center(
        child: Text('Error 404'),
      ),
    );
  }
}
