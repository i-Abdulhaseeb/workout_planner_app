import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_app/model/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage(
    this.E1,
    this.D1,
    this.func,
    this.func2,
    this.func3, {
    super.key,
  });
  final List<StrengthModel> E1;
  final List<String> D1;
  final void Function() func;
  final void Function(StrengthModel, String) func2;
  final void Function(StrengthModel, String) func3;
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

  Widget CategoryChanger(String ans) {
    Color bgColor;
    Color textColor = Colors.white;

    switch (ans) {
      case "Strength":
        bgColor = Colors.deepOrange;
        break;
      case "Cardio":
        bgColor = Colors.pinkAccent;
        break;
      default:
        bgColor = Colors.teal;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: bgColor.withOpacity(0.4),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            ans == "Strength"
                ? Icons.fitness_center
                : ans == "Cardio"
                ? Icons.favorite
                : Icons.category,
            size: 16,
            color: textColor,
          ),
          const SizedBox(width: 6),
          Text(
            ans,
            style: GoogleFonts.lato(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
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

                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.E1.length,
                      itemBuilder: (ctx, index) => Dismissible(
                        key: ValueKey(
                          "${widget.E1[index].nameOfWorkout}-${widget.D1[index]}",
                        ),
                        background: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.green.shade500,
                                Colors.teal.shade600,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeOut,
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Completed",
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          widget.func3(widget.E1[index], widget.D1[index]);
                        },
                        child: Card(
                          margin: EdgeInsets.all(8),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color.fromARGB(255, 0, 37, 67),
                                  const Color.fromARGB(255, 41, 0, 49),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CategoryChanger(
                                  widget.E1[index].trainingCategory,
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      widget.E1[index].nameOfWorkout,
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      widget.E1[index].trainingType,
                                      style: GoogleFonts.lato(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),

                                /// Date
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: Colors.white70,
                                      size: 18,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      widget.D1[index],
                                      style: GoogleFonts.lato(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /// Duration
                                    Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.clock,
                                          color: Colors.grey,
                                          size: 18,
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.E1[index].timeRequired,
                                              style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Duration",
                                              style: GoogleFonts.lato(
                                                color: Colors.white70,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    /// Calories
                                    Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.fire,
                                          color: Colors.orange,
                                          size: 18,
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.E1[index].Calories
                                                  .toString(),
                                              style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Calories",
                                              style: GoogleFonts.lato(
                                                color: Colors.white70,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    /// Exercises
                                    Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.dumbbell,
                                          color: Colors.lightBlue,
                                          size: 18,
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.E1[index].exe.toString(),
                                              style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Exercises",
                                              style: GoogleFonts.lato(
                                                color: Colors.white70,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
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
