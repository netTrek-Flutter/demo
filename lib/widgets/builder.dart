import 'dart:developer' as debug show log;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_project/widgets/default_widget_container.dart';

main() {
  buildInDefaultContainer(
    Builder(builder: (BuildContext context) {
      var queryData = MediaQuery.of(context);

      debug.log(
        queryData.orientation.toString(),
        name: 'ScaffoldWrapper',
      );
      debug.log(
        queryData.size.toString(),
        name: 'ScaffoldWrapper',
      );

      return Center(
        child: Container(
          width: 0.5 * MediaQuery.of(context).size.width,
          height: 0.5 * MediaQuery.of(context).size.height,
          color: Colors.red,
          child: Text(
            'With builder',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      );
    }),
  );
}
