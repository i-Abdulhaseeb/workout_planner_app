import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarCreator extends StatelessWidget {
  AppbarCreator(this.func, {super.key});
  final void Function() func;
  @override
  Widget build(context) {
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
}
