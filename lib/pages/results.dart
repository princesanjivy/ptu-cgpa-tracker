import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ptu_cgpa_tracker/pages/grade.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Result(),
    );
  }
}

class Result extends StatefulWidget {
  final GradePage cgpa;
  // just to check the value is passing
  double kite = 7;

  Result({Key key, this.cgpa}) : super(key: key);
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: Text(
          "Result",
          style: GoogleFonts.raleway(
              textStyle: TextStyle(
            color: Colors.deepOrange,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          )),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          // if (widget.cgpa >= 0 && widget.cgpa <= 5)
          if (widget.kite >= 0 && widget.kite <= 5)
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(children: [
                Center(
                  child: Lottie.asset(
                    "assets/success1.json",
                    height: 300,
                    width: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text.rich(TextSpan(
                      text: 'CGPA : ',
                      style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0, .5),
                              blurRadius: 1.0,
                              color: Colors.white,
                            ),
                          ],
                          color: Colors.deepOrange,
                          fontSize: size.height * .050,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'raleway'),
                      children: <TextSpan>[
                        TextSpan(
                          //  text: '${widget.cgpa}',
                          text: '${widget.kite}',
                          style: GoogleFonts.raleway(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ])),
                )
              ]),
            ),
          //  if (widget.cgpa > 5 && widget.cgpa <= 7)
          if (widget.kite > 5 && widget.kite <= 7)
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(children: [
                Center(
                  child: Lottie.asset(
                    "assets/success.json",
                    height: 300,
                    width: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text.rich(TextSpan(
                      text: 'CGPA : ',
                      style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0, .5),
                              blurRadius: 1.0,
                              color: Colors.white,
                            ),
                          ],
                          color: Colors.deepOrange,
                          fontSize: size.height * .050,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'raleway'),
                      children: <TextSpan>[
                        TextSpan(
                          //  text: '${widget.cgpa}',
                          text: '${widget.kite}',
                          style: GoogleFonts.raleway(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ])),
                )
              ]),
            ),
          // if (widget.cgpa > 7 && widget.cgpa <= 9)
          if (widget.kite > 7 && widget.kite <= 9)
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(children: [
                Center(
                  child: Lottie.asset(
                    "assets/happystar.json",
                    height: 300,
                    width: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Text.rich(TextSpan(
                      text: 'CGPA : ',
                      style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0, .5),
                              blurRadius: 1.0,
                              color: Colors.white,
                            ),
                          ],
                          color: Colors.deepOrange,
                          fontSize: size.height * .050,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'raleway'),
                      children: <TextSpan>[
                        TextSpan(
                          //  text: '${widget.cgpa}',
                          text: '${widget.kite}',
                          style: GoogleFonts.raleway(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ])),
                )
              ]),
            ),
          //  if (widget.cgpa > 9 && widget.cgpa <= 10)
          if (widget.kite > 9 && widget.kite <= 10)
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(children: [
                Center(
                  child: Lottie.asset(
                    "assets/congraluation.json",
                    height: 300,
                    width: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text.rich(TextSpan(
                      text: 'CGPA : ',
                      style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0, .5),
                              blurRadius: 1.0,
                              color: Colors.white,
                            ),
                          ],
                          color: Colors.deepOrange,
                          fontSize: size.height * .050,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'raleway'),
                      children: <TextSpan>[
                        TextSpan(
                          //  text: '${widget.cgpa}',
                          text: '${widget.kite}',
                          style: GoogleFonts.raleway(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ])),
                )
              ]),
            )
        ]),
      ),
    );
  }
}
