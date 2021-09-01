import 'package:flutter/material.dart';

void buildInDefaultContainer(Widget toBuild) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widgets Demonstration'),
        ),
        body: toBuild,
      ),
    ),
  );
}
