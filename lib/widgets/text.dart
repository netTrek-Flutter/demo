import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() {
  buildInDefaultContainer(
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Normaler text',
        ),
        Text(
          'Kursiv',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        Text(
          'fettgedruckt',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Unterstrichen',
          style: TextStyle(
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.wavy,
            decorationThickness: 3,
            decorationColor: Colors.red,
          ),
        ),
        Text(
          'Bunt',
          style: TextStyle(
            color: Colors.blue,
            backgroundColor: Colors.black,
          ),
        ),
        Text(
          'Monospace',
          style: TextStyle(
            fontFamily: 'Monospace',
          ),
        ),
        Text(
          '22.5 groß',
          style: TextStyle(
            fontSize: 22.5,
          ),
        ),
        Text(
          'Doppelte Größe',
          textScaleFactor: 2,
        ),
        Text(
          'Ich werde abgeschnitten. Mein überstehender Text wird durch ... gekennzeichnet!',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
