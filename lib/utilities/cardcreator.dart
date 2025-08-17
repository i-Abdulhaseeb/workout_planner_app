import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workout_app/utilities/execard_creator.dart';
import 'package:workout_app/model/data.dart';

class Cardcreator extends StatelessWidget {
  Cardcreator(this.demo, {super.key});
  final StrengthModel demo;
  @override
  Widget build(context) {
    int index = 0;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
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
              SizedBox(height: 10),
              Text(
                demo.nameOfWorkout,
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
                    demo.timeRequired,
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
                    demo.trainingType,
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
              ...demo.workouts.map((value) {
                index++;
                return ExecardCreator(index, value);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
