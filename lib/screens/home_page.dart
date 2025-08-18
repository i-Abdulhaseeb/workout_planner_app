import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(
    this.function1,
    this.function2,
    this.function3,
    this.appbarFunction1,
    this.appbarFunction2, {
    super.key,
  });

  final void Function() function1;
  final void Function() function2;
  final void Function() function3;
  final void Function() appbarFunction1;
  final void Function() appbarFunction2;
  Widget CardMaker({
    required String imagepath,
    required String mainLabel,
    required IconData myIcon,
    required String bodytext,
    required List<Color> CardColour,
    required List<Color> LogoColour,
    required Color ButtonColor,
    required onClickFunction,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      elevation: 8,
      shadowColor: Colors.greenAccent.withValues(alpha: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: CardColour,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: LogoColour,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(imagepath, width: 10),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      mainLabel,
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: onClickFunction,
                  icon: Icon(myIcon),
                  style: IconButton.styleFrom(foregroundColor: ButtonColor),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              bodytext,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 16),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Container(
      color: const Color.fromARGB(255, 18, 41, 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          AppBar(
            title: Text(
              "WorkOut Shuffle",
              style: GoogleFonts.strait(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 100, 25, 228),
            actions: [
              IconButton(
                onPressed: appbarFunction1,
                style: IconButton.styleFrom(foregroundColor: Colors.white),
                icon: Icon(Icons.history),
              ),
              IconButton(
                onPressed: appbarFunction2,
                style: IconButton.styleFrom(foregroundColor: Colors.white),
                icon: Icon(Icons.show_chart),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            child: Text(
              "Choose Your Workout",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(height: 15),
          CardMaker(
            imagepath: 'assets/images/yoga.png',
            mainLabel: "YOGA",
            myIcon: Icons.chevron_right_sharp,
            bodytext: "Find Balance and flexibility with mindful movement",
            CardColour: [
              const Color.fromARGB(255, 86, 0, 101),
              const Color.fromARGB(160, 59, 33, 188),
            ],
            LogoColour: [Colors.deepPurple, Colors.pinkAccent],
            ButtonColor: const Color.fromARGB(255, 0, 50, 90),
            onClickFunction: function2,
          ),
          CardMaker(
            imagepath: 'assets/images/dumbell.png',
            mainLabel: "STRENGTH",
            myIcon: Icons.chevron_right_sharp,
            bodytext: "Build Muscle and Power with targeted exercises",
            CardColour: [
              const Color.fromARGB(255, 5, 65, 7),
              const Color.fromARGB(255, 41, 143, 225),
            ],
            LogoColour: [
              const Color.fromARGB(255, 93, 0, 255),
              const Color.fromARGB(255, 0, 162, 255),
            ],
            ButtonColor: Colors.white,
            onClickFunction: function1,
          ),
          CardMaker(
            imagepath: 'assets/images/heart.png',
            mainLabel: 'CARDIO',
            myIcon: Icons.chevron_right_sharp,
            bodytext: 'Boost your Heart Rate and Burn calories fast',
            CardColour: [const Color.fromARGB(255, 130, 48, 76), Colors.grey],
            LogoColour: [Colors.pink, const Color.fromARGB(255, 0, 140, 255)],
            ButtonColor: Colors.pink,
            onClickFunction: function3,
          ),
        ],
      ),
    );
  }
}
