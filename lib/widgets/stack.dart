import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() {
  buildInDefaultContainer(
    Stack(
      children: [
        Container(
          color: Colors.green,
          width: 300,
          height: 300,
        ),
        Positioned.fill(
          top: 50,
          child: Container(
            color: Colors.lightBlue,
          ),
        ),
        Positioned(
          left: 50,
          width: 100,
          bottom: 100,
          top: 100,
          child: Container(
            color: Colors.red,
          ),
        ),
        Positioned.directional(
          textDirection: TextDirection.rtl,
          start: 10,
          width: 50,
          top: 140,
          bottom: 140,
          child: Container(
            color: Colors.black38,
          ),
        ),
        Container(
          color: Colors.amber,
          width: 100,
          height: 100,
        ),
      ],
    ),
  );
}
