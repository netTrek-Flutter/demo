import 'package:flutter/material.dart';

void buildInDefaultContainer(Widget toBuild) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter demo by netTrek'),
        ),
        body: toBuild,
      ),
    ),
  );
}

Widget createDummyPage(String name) {
  return Scaffold(
    appBar: AppBar(
      title: Text(name),
    ),
    body: Center(
      child: Text('This is $name!'),
    ),
  );
}
