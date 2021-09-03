import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_project/bloc/bloc.dart';
import 'package:flutter_demo_project/bloc/events.dart';

import 'states.dart';

main() {
  runApp(
    BlocProvider(
      create: (context) => ThemeBloc(),
      child: ThemeChanger(),
    ),
  );
}

class ThemeChanger extends StatelessWidget {
  const ThemeChanger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: BlocProvider.of(context),
      builder: (context, state) => MaterialApp(
        theme: state.theme,
        home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () =>
                    BlocProvider.of<ThemeBloc>(context).add(ToggleThemeEvent(),),
                icon: Icon(Icons.change_circle),
              ),
            ],
          ),
          body: Center(
            child: TextButton(
              child: Text('Custom Theme'),
              onPressed: () => BlocProvider.of<ThemeBloc>(context).add(
                CustomThemeEvent(
                  ThemeData.light().copyWith(primaryColor: Colors.deepPurple),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
