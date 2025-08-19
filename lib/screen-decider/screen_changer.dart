import 'package:flutter/material.dart';
import 'package:workout_app/screens/splash_screen.dart';
import 'package:workout_app/screens/home_page.dart';
import 'package:workout_app/screens/workout_shuffle_pages.dart';
import 'package:workout_app/screens/appbar_pages.dart';
import 'package:workout_app/model/data.dart';

class ScreenChanger extends StatefulWidget {
  const ScreenChanger({super.key});
  State<ScreenChanger> createState() {
    return _ScreenChangerState();
  }
}

class _ScreenChangerState extends State<ScreenChanger> {
  List<StrengthModel> SelectedExe = [];
  List<String> SelectedDate = [];
  void addExeANDdate(StrengthModel S1, String D1) {
    setState(() {
      SelectedExe.add(S1);
      SelectedDate.add(D1);
    });
  }

  void deleteExeAndDate(StrengthModel S1, String D1) {
    int index = SelectedExe.indexOf(S1);
    int index2 = SelectedDate.indexOf(D1);
    setState(() {
      SelectedExe.remove(S1);
      SelectedDate.remove(D1);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("WorkOut Completed"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              SelectedExe.insert(index, S1);
              SelectedDate.insert(index2, D1);
            });
          },
        ),
      ),
    );
  }

  var currentScreen = 'splash-screen';
  int _selectedIndex = 0;
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

  void movetoHistoryPage() {
    setState(() {
      currentScreen = 'History-screen';
    });
  }

  void moveToProgressPage() {
    setState(() {
      currentScreen = 'Progress-screen';
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
        movetoHistoryPage,
        moveToProgressPage,
      );
    } else if (currentScreen == 'strength-screen') {
      return StrengthPage(goBacktoHome, addExeANDdate);
    } else if (currentScreen == 'yoga-screen') {
      return YogaPage(goBacktoHome, addExeANDdate);
    } else if (currentScreen == 'cardio-screen') {
      return CardioPage(goBacktoHome, addExeANDdate);
    } else if (currentScreen == 'History-screen') {
      return HistoryPage(
        SelectedExe,
        SelectedDate,
        goBacktoHome,
        addExeANDdate,
        deleteExeAndDate,
      );
    } else {
      return ProgressPage();
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
