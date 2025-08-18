import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_app/model/data.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage(this.E1, this.D1, this.func, {super.key});
  final List<StrengthModel> E1;
  final List<String> D1;
  final void Function() func;
  @override
  State<HistoryPage> createState() {
    return _HistoryPageState();
  }
}

class _HistoryPageState extends State<HistoryPage> {
  int TotalCalories() {
    int sum = 0;
    for (int i = 0; i < widget.E1.length; i++) {
      sum = sum + widget.E1[i].Calories;
    }
    return sum;
  }

  int TotalTime() {
    int sum = 0;
    for (int i = 0; i < widget.E1.length; i++) {
      sum = sum + widget.E1[i].time2;
    }
    return sum;
  }

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color.fromARGB(255, 0, 67, 122), Colors.blueAccent],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            leading: IconButton(
              onPressed: widget.func,
              icon: Icon(Icons.chevron_left_outlined, size: 40),
            ),
            title: Text("WorkOut History"),
            backgroundColor: const Color.fromARGB(255, 0, 30, 54),
            foregroundColor: Colors.white,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: ListView(
                children: [
                  Text(
                    "Track Your Fitness Journey",
                    style: GoogleFonts.lato(
                      color: Color(0xFFC0C0C0),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple,
                            Color(0xFF0A4D84),
                            Colors.lightBlue,
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                widget.E1.length.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Workouts",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                TotalCalories().toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Calories",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                TotalTime().toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Time Taken",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ...widget.E1.map(
                    (e) => Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(e.nameOfWorkout),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressPage extends StatefulWidget {
  ProgressPage({super.key});
  @override
  State<ProgressPage> createState() {
    return _ProgressPageState();
  }
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(context) {
    return Text("Hey");
  }
}
