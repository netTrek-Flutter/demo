import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/default_widget_container.dart';

main() {
  buildInDefaultContainer(
    AnimatedWithController(),
  );
}

class AnimatedWithController extends StatefulWidget {
  const AnimatedWithController({Key? key}) : super(key: key);

  @override
  _AnimatedWithControllerState createState() => _AnimatedWithControllerState();
}

class _AnimatedWithControllerState extends State<AnimatedWithController>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double value = _controller.value;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
      lowerBound: 0,
      upperBound: 10,
    );
    _controller.addListener(() => setState(() => value = _controller.value));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${value.toStringAsPrecision(3)}/10 seconds',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.forward(from: 0),
        child: Icon(Icons.play_circle_fill_outlined),
      ),
    );
  }
}
