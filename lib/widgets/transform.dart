import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_demo_project/widgets/default_widget_container.dart';

main() {
  buildInDefaultContainer(
    Column(
      children: [
        Spacer(),
        Transform.rotate(
          angle: 0.5 * pi,
          child: Text('rotated'),
        ),
        Spacer(),
        Transform.scale(
          scale: 2,
          child: Text('scaled'),
        ),
        Spacer(),
        Transform.translate(
          offset: Offset(100, -100),
          child: Text('transformed'),
        ),
        Spacer(),
      ],
    ),
  );
}
