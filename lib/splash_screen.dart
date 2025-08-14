import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  List<Color> ColorSelected(bool isDarkMode) {
    if (isDarkMode != true) {
      return [Color(0xFF6C5CE7), Color(0xFF00CEC9)];
    } else {
      return [
        const Color.fromARGB(255, 219, 145, 34),
        Colors.lightGreen,
        const Color.fromARGB(255, 23, 16, 16),
        Colors.grey,
        Colors.pinkAccent,
      ];
    }
  }

  late AnimationController _controller;
  late Animation<double> _floating;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);

    _floating = Tween<double>(
      begin: 0,
      end: 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: ColorSelected(isDarkMode),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _floating,
              builder: (context, child) => Transform.translate(
                offset: Offset(0, -_floating.value),
                child: child,
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/workout_logo.png',
                  width: 70,
                  height: 60,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "FitFlow",
              style: GoogleFonts.strait(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Transform your Body ,Elevate your mind",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
            SizedBox(height: 30),
            LoadingAnimationWidget.flickr(
              leftDotColor: Colors.lightBlueAccent,
              rightDotColor: Colors.black12,
              size: 70,
            ),
          ],
        ),
      ),
    );
  }
}
