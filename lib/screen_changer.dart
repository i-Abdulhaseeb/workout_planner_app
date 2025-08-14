import 'package:flutter/material.dart';
import 'package:workout_app/splash_screen.dart';
import 'package:workout_app/workout_home.dart';

class ScreenChanger extends StatefulWidget {
  ScreenChanger({super.key});
  State<ScreenChanger> createState() {
    return _ScreenChangerState();
  }
}

class _ScreenChangerState extends State<ScreenChanger> {
  @override
  Widget build(context) {
    return SplashScreen();
  }
}
