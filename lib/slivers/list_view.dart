import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

Widget _buildFromIndex(int index, {String prefix = 'Element'}) => Card(
      child: Container(
        height: 50,
        //width: 200,
        child: Text('$prefix $index'),
      ),
    );

main() {
  buildInDefaultContainer(
    GridView.count(
      crossAxisCount: 1,
      scrollDirection: Axis.horizontal,
      children: [
        ListView(
          children: List.generate(
            10,
            (index) => _buildFromIndex(index, prefix: 'DefaultConstructor'),
          ),
        ),
        ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) => _buildFromIndex(index, prefix: 'Separated'),
          itemCount: 10,
        ),
        ListView.builder(
          itemBuilder: (context, index) => _buildFromIndex(index, prefix: 'Builder'),
          itemCount: 10,
        ),
        ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => _buildFromIndex(index, prefix: 'Custom'),
          ),
        ),
      ],
    ),
  );
}
