import 'package:flutter/material.dart';

abstract class ThemeState {
  abstract final ThemeData theme;
}

class LightThemeState extends ThemeState {
  @override
  get theme => ThemeData.light();
}

class DarkThemeState extends ThemeState {
  @override
  get theme => ThemeData.dark();
}

class CustomThemeState extends ThemeState {
  @override
  final ThemeData theme;

  CustomThemeState(this.theme);
}
