import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ThemeData unserTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  fontFamily: 'Monospace',
  primaryColor: Colors.green,
  accentColor: Colors.deepOrangeAccent,
  textTheme: TextTheme(
    bodyText2: TextStyle(
      fontSize: 14,
      color: Colors.black87,
      wordSpacing: 2,
    ),
    headline1: TextStyle(
      fontSize: 28,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.double,
      decorationColor: Colors.black54,
    ),
    button: TextStyle(
      fontSize: 16,
      color: Colors.deepPurpleAccent,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 0.5,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.greenAccent,
    shadowColor: Colors.grey,
    elevation: 10,
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  ),
  dividerColor: Colors.tealAccent,
);

main() {
  runApp(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Theme(
        data: unserTheme,
        child: ThemeDemonstrationView(),
      ),
    ),
  );
}

class ThemeDemonstrationView extends StatelessWidget {
  const ThemeDemonstrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      color: theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: theme.accentColor,
            height: 100,
            child: Center(
              child: Text(
                'MyTheme',
                style: theme.textTheme.headline1?.copyWith(
                  color: theme.primaryColor,
                  decorationColor: theme.primaryColor.withOpacity(0.75),
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                ListView(
                  children: [
                    Card(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Button'),
                      ),
                    ),
                    Divider(),
                    Card(
                      child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                    ),
                    Divider(),
                    Card(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.title),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.height),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.margin),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.translate),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  width: 50,
                  height: 50,
                  right: 10,
                  bottom: 10,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
