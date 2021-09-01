import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Hello World!')),
        backgroundColor: Colors.amber,
        appBar: AppBar(title: Text('AppBar')),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.arrow_left_outlined), label: 'left'),
            BottomNavigationBarItem(icon: Icon(Icons.arrow_right_outlined), label: 'right'),
          ],
        ),
      ),
    ),
  );
}
