import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_project/widgets/default_widget_container.dart';

main() {
  buildInDefaultContainer(
    Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Positioned(
          left: 100,
          width: 100,
          bottom: 200,
          top: 200,
          child: Container(
            color: Colors.red,
          ),
        ),
      ],
    ),
  );
}
