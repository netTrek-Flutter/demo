import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/default_widget_container.dart';

main() {
  buildInDefaultContainer(
    MyDetector(),
  );
}

class MyDetector extends StatefulWidget {
  const MyDetector({Key? key}) : super(key: key);

  @override
  _MyDetectorState createState() => _MyDetectorState();
}

class _MyDetectorState extends State<MyDetector> {
  String _message = '---';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _message = 'Tap'),
      onDoubleTap: () => setState(() => _message = 'Double Click'),
      onForcePressPeak: (details) =>
          setState(() => _message = 'Force Press: ${details.pressure}'),
      onLongPress: () => setState(() => _message = 'Long Press'),
      onHorizontalDragEnd: (details) => setState(
          () => _message = 'Horizontal Drag: ${details.primaryVelocity}'),
      onHorizontalDragUpdate: (details) => setState(
          () => _message = 'Horizontal Draging: ${details.primaryDelta}'),
      onVerticalDragEnd: (details) => setState(
          () => _message = 'Vertical Drag: ${details.primaryVelocity}'),
      onVerticalDragUpdate: (details) => setState(
          () => _message = 'Vertical Draging: ${details.primaryDelta}'),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.red,
        child: Center(
          child: Text(
            _message,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
