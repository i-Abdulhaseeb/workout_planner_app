import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_app/model/demo_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget exeCardMaker(int index, String name) {
  return Card(
    margin: EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(16),
    ),
    clipBehavior: Clip.hardEdge,
    child: Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.deepPurpleAccent],
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              index.toString(),
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 8),
          Text(
            name,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget createAppBar(func) {
  return AppBar(
    leading: IconButton(
      onPressed: func,
      icon: Icon(Icons.chevron_left_outlined, size: 40),
    ),

    title: Text(
      "WorkOut Generator",
      style: GoogleFonts.strait(fontWeight: FontWeight.bold, fontSize: 25),
    ),
    backgroundColor: const Color.fromARGB(255, 0, 36, 99),
    foregroundColor: Colors.white,
  );
}

Widget cardMaker() {
  int index = 0;
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25), // <-- outer Card corners
    ),
    clipBehavior: Clip.hardEdge,
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.all(5),
              color: const Color.fromARGB(255, 41, 37, 122),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(30),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Text(
                  "Strength 💪",
                  style: GoogleFonts.lato(
                    color: Colors.lightBlue,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              demoData[0].nameOfWorkout,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.timer_sharp,
                  color: const Color.fromARGB(255, 22, 42, 142),
                  size: 30,
                ),
                SizedBox(width: 5),
                Text(
                  demoData[0].timeRequired,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 10),
                FaIcon(
                  FontAwesomeIcons.bullseye,
                  color: const Color.fromARGB(255, 22, 42, 142),
                  size: 25,
                ),
                SizedBox(width: 8),
                Text(
                  demoData[0].trainingType,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Exercises : ",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            ...demoData[0].workouts.map((value) {
              index++;
              return exeCardMaker(index, value);
            }),
          ],
        ),
      ),
    ),
  );
}

class StrengthPage extends StatefulWidget {
  StrengthPage(this.function1, {super.key});
  final void Function() function1;
  @override
  State<StrengthPage> createState() {
    return _StrengthPageState();
  }
}

class _StrengthPageState extends State<StrengthPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 36, 99)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          createAppBar(widget.function1),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  cardMaker(),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.all(10),
                        side: BorderSide(
                          color: Color.fromARGB(255, 102, 68, 148),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.shuffle, size: 20),
                          SizedBox(width: 8),
                          Text(
                            "Shuffle WorkOut",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF00CED1),
                        padding: EdgeInsets.all(10),
                        side: BorderSide(color: Color(0xFF008B8B), width: 4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.calendar,
                            size: 20,
                            color: Color(0xFF008B8B),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Schedule WorkOut",
                            style: GoogleFonts.lato(
                              color: Color(0xFF008B8B),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Card(
                      color: Color.fromARGB(
                        255,
                        68,
                        124,
                        244,
                      ).withValues(alpha: 0.9),
                      elevation: 0,
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 25,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.boltLightning,
                              size: 20,
                              color: const Color.fromARGB(255, 0, 20, 88),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '"Your only limit is your mind. Push beyond it!"',
                              style: GoogleFonts.lato(
                                color: Color.fromARGB(255, 0, 20, 88),
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
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
