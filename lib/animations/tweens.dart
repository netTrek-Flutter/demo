import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() {
  buildInDefaultContainer(
    AnimatedWithControllerAndTween(),
  );
}

class AnimatedWithControllerAndTween extends StatefulWidget {
  const AnimatedWithControllerAndTween({Key? key}) : super(key: key);

  @override
  _AnimatedWithControllerAndTweenState createState() => _AnimatedWithControllerAndTweenState();
}

class _AnimatedWithControllerAndTweenState extends State<AnimatedWithControllerAndTween>
    with SingleTickerProviderStateMixin {
  static final Tween<int> _toIntTween = IntTween(begin: 0, end: 10);
  static final Tween<String> _addUnitTween = FormatNumberTween(
    numberFormatter: (double num) => '${_toIntTween.transform(num)}/10 Sekunden',
    begin: '0/10 Sekunden',
    end: '10/10 Sekunden',
  );

  late final AnimationController _controller;
  late final Animation<String> _animation = _controller.drive(_addUnitTween);
  late String value = _addUnitTween.end!;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    _controller.addListener(() => setState(() => value = _animation.value));
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
          value,
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

class FormatNumberTween extends Tween<String> {
  final String Function(double) numberFormatter;

  FormatNumberTween({required this.numberFormatter, String? begin, String? end})
      : super(begin: begin, end: end);

  @override
  String lerp(double num) {
    return numberFormatter(num);
  }

  @override
  String evaluate(Animation<double> animation) => lerp(animation.value);
}
