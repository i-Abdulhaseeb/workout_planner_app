import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ShuffleButton extends StatelessWidget {
  ShuffleButton(this.function1, {super.key});
  final void Function() function1;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: function1,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        padding: EdgeInsets.all(10),
        side: BorderSide(color: Color.fromARGB(255, 102, 68, 148), width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.shuffle, size: 20),
          SizedBox(width: 8),
          Text(
            "Shuffle WorkOut",
            style: GoogleFonts.lato(color: Colors.white, fontSize: 17),
          ),
        ],
      ),
    );
  }
}

class ScheduleButton extends StatelessWidget {
  ScheduleButton(this.function1, {super.key});
  final void Function() function1;
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: function1,
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
    );
  }
}
