import 'package:flutter/widgets.dart';
import 'package:flutter_demo_project/widgets/default_widget_container.dart';

main() {
  buildInDefaultContainer(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Me: Hello World!'),
        Text('World: They always say hello world, ...'),
        Text('But they never ask: "How is World?"'),
      ],
    ),
  );
}
