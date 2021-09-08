import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/default_widget_container.dart';

main() {
  buildInDefaultContainer(
    Navigator(
      initialRoute: 'page1',
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case 'page1':
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('Page1'),
                ),
                body: Center(
                  child: IconButton(
                    icon: Icon(Icons.change_circle),
                    onPressed: () => Navigator.pushNamed(context, 'page2'),
                  ),
                ),
              ),
            );
          case 'page2':
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('Page2'),
                ),
                body: Center(
                  child: IconButton(
                    icon: Icon(Icons.change_circle),
                    onPressed: () => Navigator.pushNamed(context, 'page1'),
                  ),
                ),
              ),
            );
        }
      },
      onUnknownRoute: (routeSettings) => MaterialPageRoute(
        builder: (context) => Center(
          child: Text('Route ${routeSettings.name} unavailable!'),
        ),
      ),
    ),
  );
}
