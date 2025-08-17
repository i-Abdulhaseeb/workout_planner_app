import 'package:flutter/material.dart';
import 'package:workout_app/utilities/appbar_creator.dart';
import 'package:workout_app/utilities/cardcreator.dart';
import 'package:workout_app/model/demo_data.dart';
import 'dart:math';
import 'package:workout_app/utilities/buttons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StrengthPage extends StatefulWidget {
  StrengthPage(this.function1, {super.key});
  final void Function() function1;
  @override
  State<StrengthPage> createState() {
    return _StrengthPageState();
  }
}

class _StrengthPageState extends State<StrengthPage> {
  DateTime? _currentDate;
  int i = 0;
  void changeExe() {
    setState(() {
      int c;
      do {
        final random = Random();
        c = random.nextInt(3);
      } while (c == i);

      i = c;
    });
  }

  void Calendar() async {
    final now = DateTime.now();
    final fDate = DateTime(now.year + 1, now.month, now.day);
    final selected_Date = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: fDate,
      initialDate: now,
    );
    if (selected_Date != null) {
      setState(() {
        _currentDate = selected_Date;
        Navigator.pop(context);
      });
    }
  }

  void ShowCalendar() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Container(
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),

        child: Center(
          child: ElevatedButton.icon(
            onPressed: Calendar,
            icon: FaIcon(FontAwesomeIcons.calendar),
            label: Text(
              "Pick A Date ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 36, 99)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppbarCreator(widget.function1),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Cardcreator(demoData[i]),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ShuffleButton(changeExe),
                  ),
                  SizedBox(height: 15),
                  ScheduleButton(ShowCalendar),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Yoga page Class

class YogaPage extends StatefulWidget {
  YogaPage(this.function1, {super.key});
  final void Function() function1;
  @override
  State<YogaPage> createState() {
    return _YogaPageState();
  }
}

class _YogaPageState extends State<YogaPage> {
  DateTime? _currentDate;
  int i = 0;
  void changeExe() {
    setState(() {
      int c;
      do {
        final random = Random();
        c = random.nextInt(3);
      } while (c == i);

      i = c;
    });
  }

  void Calendar() async {
    final now = DateTime.now();
    final fDate = DateTime(now.year + 1, now.month, now.day);
    final selected_Date = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: fDate,
      initialDate: now,
    );
    if (selected_Date != null) {
      setState(() {
        _currentDate = selected_Date;
        Navigator.pop(context);
      });
    }
  }

  void ShowCalendar() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Container(
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),

        child: Center(
          child: ElevatedButton.icon(
            onPressed: Calendar,
            icon: FaIcon(FontAwesomeIcons.calendar),
            label: Text(
              "Pick A Date ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 36, 99)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppbarCreator(widget.function1),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Cardcreator(demoData2[i]),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ShuffleButton(changeExe),
                  ),
                  SizedBox(height: 15),
                  ScheduleButton(ShowCalendar),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardioPage extends StatefulWidget {
  CardioPage(this.function1, {super.key});
  final void Function() function1;
  @override
  State<CardioPage> createState() {
    return _CardioPageState();
  }
}

class _CardioPageState extends State<CardioPage> {
  DateTime? _currentDate;
  int i = 0;
  void changeExe() {
    setState(() {
      int c;
      do {
        final random = Random();
        c = random.nextInt(3);
      } while (c == i);

      i = c;
    });
  }

  void Calendar() async {
    final now = DateTime.now();
    final fDate = DateTime(now.year + 1, now.month, now.day);
    final selected_Date = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: fDate,
      initialDate: now,
    );
    if (selected_Date != null) {
      setState(() {
        _currentDate = selected_Date;
        Navigator.pop(context);
      });
    }
  }

  void ShowCalendar() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Container(
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),

        child: Center(
          child: ElevatedButton.icon(
            onPressed: Calendar,
            icon: FaIcon(FontAwesomeIcons.calendar),
            label: Text(
              "Pick A Date ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 36, 99)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppbarCreator(widget.function1),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Cardcreator(demoData3[i]),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ShuffleButton(changeExe),
                  ),
                  SizedBox(height: 15),
                  ScheduleButton(ShowCalendar),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
