import 'package:flutter/material.dart';
import 'package:workout_app/splash_screen.dart';
import 'package:workout_app/workout_home.dart';
import 'package:workout_app/home_page.dart';
import 'package:workout_app/workout_shuffle_pages.dart';

class ScreenChanger extends StatefulWidget {
  ScreenChanger({super.key});
  State<ScreenChanger> createState() {
    return _ScreenChangerState();
  }
}

class _ScreenChangerState extends State<ScreenChanger> {
  var currentScreen = 'splash-screen';
  void goBacktoHome() {
    setState(() {
      currentScreen = 'home-page';
    });
  }

  void moveToStrengthWorkoutPage() {
    setState(() {
      currentScreen = 'strength-screen';
    });
  }

  Widget ScreenDecider() {
    if (currentScreen == 'splash-screen') {
      return SplashScreen();
    } else if (currentScreen == 'home-page') {
      return HomePage(moveToStrengthWorkoutPage);
    } else {
      return StrengthPage(goBacktoHome);
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
