import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_app/model/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:workout_app/utilities/category_changer.dart';

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
                        key: UniqueKey(),
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
  ProgressPage(this.func, this.completedExe, this.completedDate, {super.key});
  final void Function() func;
  final List<StrengthModel> completedExe;
  final List<String> completedDate;
  @override
  State<ProgressPage> createState() {
    return _ProgressPageState();
  }
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(context) {
    Map<String, double> FrequencyContainer = {};
    FrequencyContainer["Strength"] = 0;
    FrequencyContainer["Yoga"] = 0;
    FrequencyContainer["Cardio"] = 0;
    for (int i = 0; i < widget.completedExe.length; i++) {
      String category = widget.completedExe[i].trainingCategory;
      FrequencyContainer[category] = (FrequencyContainer[category] ?? 0) + 1;
    }
    final List<ChartData> chartData = [
      ChartData("Strength", FrequencyContainer["Strength"]!),
      ChartData("Yoga", FrequencyContainer["Yoga"]!),
      ChartData("Cardio", FrequencyContainer["Cardio"]!),
    ];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color.fromARGB(255, 0, 67, 122), Colors.blueAccent],
        ),
      ),
      child: Center(
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                onPressed: widget.func,
                icon: FaIcon(FontAwesomeIcons.angleLeft, color: Colors.white),
              ),
              title: Text(
                "Completed WorkOuts",
                style: GoogleFonts.strait(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Color.fromARGB(255, 0, 30, 54),
            ),
            Container(
              width: 300,
              height: 400,
              child: SfCircularChart(
                title: ChartTitle(
                  text: 'Completed WorkOuts Ratio',
                  textStyle: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                legend: Legend(
                  isVisible: true,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CircularSeries>[
                  PieSeries<ChartData, String>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.category,

                    yValueMapper: (ChartData data, _) => data.value,
                    dataLabelMapper: (ChartData data, _) => '${data.value}%',
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    explode: true, // makes slices pop out on selection
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.completedExe.length,
                itemBuilder: (ctx, index) => Card(
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
                          widget.completedExe[index].trainingCategory,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              widget.completedExe[index].nameOfWorkout,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              widget.completedExe[index].trainingType,
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
                              widget.completedDate[index],
                              style: GoogleFonts.lato(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.completedExe[index].timeRequired,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.completedExe[index].Calories
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.completedExe[index].exe.toString(),
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
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final String category;
  final double value;

  ChartData(this.category, this.value);
}
