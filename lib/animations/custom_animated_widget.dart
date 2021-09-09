import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() {
  buildInDefaultContainer(
    MyStateful(),
  );
}

class MyStateful extends StatefulWidget {
  const MyStateful({Key? key}) : super(key: key);

  @override
  _MyStatefulState createState() => _MyStatefulState();
}

class _MyStatefulState extends State<MyStateful> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 200,
      duration: Duration(seconds: 3),
    );
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedWidget(
      listenable: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CustomAnimatedWidget extends AnimatedWidget {
  CustomAnimatedWidget({Key? key, required Animation<double> listenable})
      : super(key: key, listenable: listenable);

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}
