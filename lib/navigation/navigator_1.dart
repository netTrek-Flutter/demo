import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/default_widget_container.dart';

main() {
  buildInDefaultContainer(
    Builder(
      builder: (context) => Center(
        child: IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(title: Text('Pushed route'),),
                body: Center(
                  child: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
