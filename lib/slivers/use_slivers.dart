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
    CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Slivers Example'),
          backgroundColor: Colors.deepOrange,
          elevation: 10,
          expandedHeight: 200,
          pinned: true,
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 10),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _buildFromIndex(index),
                childCount: 8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
              (context, index) => _buildFromIndex(index),
              childCount: 15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 10),
          sliver: SliverToBoxAdapter(
            child: Container(
              color: Colors.deepOrange,
              height: 50,
            ),
          ),
        ),
      ],
    ),
  );
}
