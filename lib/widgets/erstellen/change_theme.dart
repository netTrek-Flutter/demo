import 'package:flutter/material.dart';

main() {
  runApp(
    ChangeTheme(
      startWith: ThemeMode.dark,
    ),
  );
}

class ChangeTheme extends StatefulWidget {
  final ThemeMode startWith;

  const ChangeTheme({Key? key, this.startWith = ThemeMode.light})
      : super(key: key);

  @override
  _ChangeThemeState createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  late ThemeMode currentThemeMode = widget.startWith;

  void toggleTheme() {
    setState(() {
      currentThemeMode = (currentThemeMode == ThemeMode.light)
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentThemeMode,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: toggleTheme,
              icon: Icon(Icons.change_circle),
            ),
          ],
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
