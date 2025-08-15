import 'package:flutter/material.dart';
import 'package:workout_app/splash_screen.dart';
import 'package:workout_app/workout_home.dart';
import 'package:workout_app/home_page.dart';

class ScreenChanger extends StatefulWidget {
  ScreenChanger({super.key});
  State<ScreenChanger> createState() {
    return _ScreenChangerState();
  }
}

class _ScreenChangerState extends State<ScreenChanger> {
  var currentScreen = 'splash-screen';
  Widget ScreenDecider() {
    if (currentScreen == 'splash-screen') {
      return SplashScreen();
    } else {
      return HomePage();
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        currentScreen = 'home-page';
      });
    });
  }

  @override
  Widget build(context) {
    return ScreenDecider();
  }
}
