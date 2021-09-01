import 'package:flutter/cupertino.dart';

main() {
  runApp(
    CupertinoApp(
      home: CupertinoTabScaffold(
        tabBuilder: (context, _) => CupertinoPageScaffold(
          child: Center(child: Text('Hello World!')),
          backgroundColor: CupertinoColors.systemYellow,
          navigationBar: CupertinoNavigationBar(
            middle: Text('Hi'),
          ),
        ),
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.arrow_left_circle), label: 'left'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.arrow_right_circle), label: 'right'),
          ],
        ),
      ),
    ),
  );
}
