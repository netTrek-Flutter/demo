import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo_project/widgets/default_widget_container.dart';

main() {
  buildInDefaultContainer(
    CustomScrollView(
      slivers: [
        SliverJiggle(
          jiggle: (offset) => 20 * (sin(pi * (offset/10))).abs(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Card(
              elevation: 10,
              child: Container(
                height: 50,
                child: Text("Element $index"),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class SliverJiggle extends SingleChildRenderObjectWidget {
  final double Function(double) jiggle;

  const SliverJiggle({required this.jiggle, Key? key}) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSliverJiggle(jiggle);
  }
}

class RenderSliverJiggle extends RenderSliver {
  final double Function(double) jiggleCreator;

  RenderSliverJiggle(this.jiggleCreator);

  //Damit der Effekt nicht durch das LazyLoading beendet wird
  @override
  bool get alwaysNeedsCompositing => true;
  @override
  bool get needsCompositing => true;

  @override
  void performLayout() {
    double jiggle = jiggleCreator(constraints.scrollOffset);

    geometry = SliverGeometry(
      //Eingenommener Platz
      scrollExtent: jiggle,
      //gezeichnete Größe
      paintExtent: 0,
      maxPaintExtent: 0,
    );
  }
}
