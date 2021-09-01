import 'package:flutter/cupertino.dart';

main() {
  runApp(
    CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(color: CupertinoColors.systemRed),
        ),
      ),
      home: CupertinoPageScaffold(
        child: Center(
          child: Builder(
            builder: (context) => Text(
              'Hello World!',
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
          ),
        ),
      ),
    ),
  );
}
