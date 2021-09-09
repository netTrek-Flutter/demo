import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() {
  buildInDefaultContainer(
    Container(
      child: FlutterLogo(),
      margin: EdgeInsets.all(50),
      padding: EdgeInsets.all(50),
      width: 200,
      height: 400,
      color: Colors.greenAccent,
      alignment: Alignment.bottomCenter,
      transform: Matrix4.rotationZ(0.75 * pi),
      transformAlignment: Alignment.center,
    ),
  );
}
