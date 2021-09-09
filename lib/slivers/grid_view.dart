import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

Widget _buildFromColor(Color color) {
  return Container(
    color: color,
  );
}

Widget _buildFromIndex(int index) {
  switch (index % 8) {
    case 0:
      return _buildFromColor(Colors.deepPurple);
    case 1:
      return _buildFromColor(Colors.amber);
    case 2:
      return _buildFromColor(Colors.blue);
    case 3:
      return _buildFromColor(Colors.red);
    case 4:
      return _buildFromColor(Colors.green);
    case 5:
      return _buildFromColor(Colors.teal);
    case 6:
      return _buildFromColor(Colors.cyan);
    case 7:
      return _buildFromColor(Colors.orange);
  }
  throw Exception();
}

main() {
  buildInDefaultContainer(
    ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 200,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              20,
              (index) => _buildFromIndex(index),
            ),
          ),
        ),
        VerticalDivider(),
        Container(
          width: 200,
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(
              40,
              (index) => _buildFromIndex(index),
            ),
          ),
        ),
        VerticalDivider(),
        Container(
          width: 200,
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (BuildContext context, int index) =>
                _buildFromIndex(index),
            itemCount: 80,
          ),
        ),
        VerticalDivider(),
        Container(
          width: 200,
          child: GridView.custom(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => _buildFromIndex(index),
                childCount: 160),
          ),
        ),
        VerticalDivider(),
        Container(
          width: 200,
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
            children: List.generate(
              320,
              (index) => _buildFromIndex(index),
            ),
          ),
        ),
      ],
    ),
  );
}
