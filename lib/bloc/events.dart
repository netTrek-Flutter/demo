import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class LightThemeEvent extends ThemeEvent {}

class DarkThemeEvent extends ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}

class CustomThemeEvent extends ThemeEvent {
  final ThemeData theme;

  CustomThemeEvent(this.theme);
}