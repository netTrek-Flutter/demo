import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/default_widget_container.dart';

main() {
  buildInDefaultContainer(
    Center(
      child: CustomPaint(
        painter: MyPainter(color: Colors.red),
        foregroundPainter:
            MyPainter(color: Colors.white.withOpacity(0.3), scalar: 0.5),
        child: Container(
          width: 300,
          height: 300,
          child: Center(
            child: Text('Im Kreis'),
          ),
        ),
      ),
    ),
  );
}

class MyPainter extends CustomPainter {
  final double scalar;
  final Color color;

  MyPainter({required this.color, this.scalar = 1});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(size.center(Offset(0, 0)),
        size.shortestSide * 0.5 * scalar, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }

  @override
  bool operator ==(Object other) {
    return (other is MyPainter) &&
        (other.scalar == this.scalar) &&
        (other.color == this.color);
  }

  @override
  int get hashCode => super.hashCode;
}
