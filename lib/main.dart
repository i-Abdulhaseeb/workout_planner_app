import 'package:flutter/material.dart';
import 'package:workout_app/screen-decider/screen_changer.dart';

var kLightScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF6C5CE7),
  onPrimary: Colors.white,
  secondary: Color(0xFF00CEC9),
  onSecondary: Colors.white,
  surfaceBright: Color(0xFFF8F9FA),
  surface: Colors.white,
  onSurface: Color(0xFF0D1117),
  error: Colors.red,
  onError: Colors.white,
);

var kDarkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF6C5CE7),
  onPrimary: Colors.white,
  secondary: Color(0xFF00CEC9),
  onSecondary: Colors.white,
  surfaceBright: Color(0xFFF8F9FA),
  surface: Colors.white,
  onSurface: Color(0xFF0D1117),
  error: Colors.red,
  onError: Colors.white,
);
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(colorScheme: kLightScheme),
      home: Scaffold(body: ScreenChanger()),
    ),
  );
}
