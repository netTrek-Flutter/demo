import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/default_widget_container.dart';

main() {
  buildInDefaultContainer(
    AnimiereContainer(
      defaultSize: 20,
    ),
  );
}

class AnimiereContainer extends StatefulWidget {
  const AnimiereContainer({Key? key, required this.defaultSize})
      : super(key: key);

  final double defaultSize;

  @override
  _AnimiereContainerState createState() => _AnimiereContainerState();
}

class _AnimiereContainerState extends State<AnimiereContainer>
    with SingleTickerProviderStateMixin {
  late double _size = widget.defaultSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              color: Colors.red,
              width: _size,
              height: _size,
            ),
          ),
          Spacer(),
          Slider(
            onChanged: (double value) =>
                setState(() => _size = value * widget.defaultSize),
            value: _size / widget.defaultSize,
            min: 1,
            max: 10,
            divisions: 9,
          )
        ],
      ),
    );
  }
}
