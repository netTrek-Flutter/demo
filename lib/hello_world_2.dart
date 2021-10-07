import 'package:flutter/widgets.dart';

main() {
  runApp(
    Column(
      children: [
        Text('Hello', textDirection: TextDirection.ltr),
        Text('World!', textDirection: TextDirection.ltr),
      ],
    ),
  );
}
