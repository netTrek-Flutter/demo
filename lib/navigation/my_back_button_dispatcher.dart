import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_demo_project/navigation/my_router_delegate.dart';

class MyBackButtonDispatcher extends BackButtonDispatcher with WidgetsBindingObserver {
  @override
  Future<bool> didPopRoute() {
    log('Hi');
    return MyRouterDelegate.popRouteOnInstance();
  }
}