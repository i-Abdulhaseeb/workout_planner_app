import 'package:flutter/material.dart';
import 'package:workout_app/screens/splash_screen.dart';
import 'package:workout_app/screens/home_page.dart';
import 'package:workout_app/screens/workout_shuffle_pages.dart';

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

  void moveToYogaPage() {
    setState(() {
      currentScreen = 'yoga-screen';
    });
  }

  void moveToCardioPage() {
    setState(() {
      currentScreen = 'cardio-screen';
    });
  }

  Widget ScreenDecider() {
    if (currentScreen == 'splash-screen') {
      return SplashScreen();
    } else if (currentScreen == 'home-page') {
      return HomePage(
        moveToStrengthWorkoutPage,
        moveToYogaPage,
        moveToCardioPage,
      );
    } else if (currentScreen == 'strength-screen') {
      return StrengthPage(goBacktoHome);
    } else if (currentScreen == 'yoga-screen') {
      return YogaPage(goBacktoHome);
    } else {
      return CardioPage(goBacktoHome);
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
