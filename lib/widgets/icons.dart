import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() {
  buildInDefaultContainer(
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          Icons.arrow_right,
        ),
        Icon(
          CupertinoIcons.arrow_right,
        ),
        Icon(
          Icons.adaptive.arrow_forward,
          color: Colors.red,
          size: 60,
        ),
      ],
    ),
  );
}
