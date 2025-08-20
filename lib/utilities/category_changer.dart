import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChanger extends StatelessWidget {
  CategoryChanger(this.ans, {super.key});
  final String ans;
  Widget CategoryChangerfunc(String ans) {
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
            color: bgColor.withValues(),
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
    return CategoryChangerfunc(ans);
  }
}
