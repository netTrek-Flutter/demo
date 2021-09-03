import 'dart:developer' as debug show log;

import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: ScaffoldWrapper(
        child: FirstStateless(
          title: "I'm 50%!",
        ),
      ),
    ),
  );
}

class FirstStateless extends StatelessWidget {
  final String prefix = 'title:';
  final String title;

  const FirstStateless({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debug.log(
      MediaQuery.of(context).size.toString(),
      name: 'FirstStateless',
    );

    return Center(
      child: Container(
        width: 0.5 * MediaQuery.of(context).size.width,
        height: 0.5 * MediaQuery.of(context).size.height,
        color: Colors.red,
        child: Text(
          //prefix +
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}

class ScaffoldWrapper extends StatelessWidget {
  final Widget? child;

  const ScaffoldWrapper({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);

    debug.log(
      queryData.orientation.toString(),
      name: 'ScaffoldWrapper',
    );
    debug.log(
      queryData.size.toString(),
      name: 'ScaffoldWrapper',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold Wrapper'),
      ),
      body: child,
    );
  }
}
