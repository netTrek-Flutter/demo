import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.red),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Builder(
            builder: (context) => Text(
              'Hello World!',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
      ),
    ),
  );
}
