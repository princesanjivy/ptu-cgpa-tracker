import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: About(),
    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About",
          style: GoogleFonts.raleway(
              textStyle: TextStyle(
            color: Colors.deepOrange,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          )),
        ),
        backgroundColor: Colors.white12,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white12,
                  width: 10,
                ),
              ),
              child: Image.asset(
                'assets/undraw_Calculator_0evy.png',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 20),
            child: Text(
              'Allow PEC students to calculate their CGPA, keep track of current semester’s CGPA so that it will give overall CGPA and current sem’s CGPA, in addition to that, department wise CGPA rank system overall & per semester',
              style: GoogleFonts.raleway(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.deepOrange,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 20),
            child: Text(
              'It is easy and quick app to generate the CGPA for all semester and current semester',
              style: GoogleFonts.raleway(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.deepOrange,
              ),
            ),
          )
        ],
      ),
    );
  }
}
