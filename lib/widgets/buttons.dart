import 'dart:developer' as debug show log;

import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widgets Demonstration'),
        ),
        body: Column(
          children: [
            TextButton(
              child: Text('Text Button'),
              onPressed: () {
                debug.log('Text Button pressed!');
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                debug.log('Icon Button pressed!');
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            debug.log('fab pressed!');
          },
        ),
      ),
    ),
  );
}
