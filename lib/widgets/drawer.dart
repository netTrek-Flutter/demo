import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() {
  runApp(
    MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('<- Drawer'),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(child: Text('Drawer')),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ...List.generate(
                  10,
                  (index) => ListTile(
                    title: Text('Page $index'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => createDummyPage('Page $index'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
