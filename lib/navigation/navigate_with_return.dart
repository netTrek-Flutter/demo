import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() {
  buildInDefaultContainer(
    DefaultRoute(),
  );
}

class DefaultRoute extends StatefulWidget {
  const DefaultRoute({Key? key}) : super(key: key);

  @override
  _DefaultRouteState createState() => _DefaultRouteState();
}

class _DefaultRouteState extends State<DefaultRoute> {
  Duration? _duration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        Text(
          'Duration is ${_duration?.inSeconds} seconds',
          textAlign: TextAlign.center,
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: () async {
            _duration = await Navigator.push<Duration>(
              context,
              MaterialPageRoute(
                builder: (context) => RouteToPush(),
              ),
            );
            setState(() {});
          },
        ),
        Spacer(),
      ],
    );
  }
}

class RouteToPush extends StatelessWidget {
  final DateTime start = DateTime.now();

  RouteToPush({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pushed route'),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.remove_circle),
          onPressed: () => Navigator.pop(
            context,
            DateTime.now().difference(
              start,
            ),
          ),
        ),
      ),
    );
  }
}
