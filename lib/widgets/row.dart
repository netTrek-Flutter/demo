import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/default_widget_container.dart';

main() {
  buildInDefaultContainer(
    Row(
      children: [
        Icon(Icons.adaptive.arrow_back),
        Icon(Icons.adaptive.share),
        Icon(Icons.adaptive.more_outlined),
      ],
    ),
  );
}
