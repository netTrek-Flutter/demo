import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() {
  runApp(
    MaterialApp(
      home: TabsNavigation(),
    ),
  );
}

class TabsNavigation extends StatefulWidget {
  const TabsNavigation({Key? key}) : super(key: key);

  @override
  _TabsNavigationState createState() => _TabsNavigationState();
}

class _TabsNavigationState extends State<TabsNavigation> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab navigation'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: 'Page 0'),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_upward), label: 'Page 1'),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_forward), label: 'Page 2'),
        ],
        currentIndex: _selected,
        onTap: (index) => setState(() => _selected = index),
      ),
      body: createDummyPage('Page $_selected'),
    );
  }
}
