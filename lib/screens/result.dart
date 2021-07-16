import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ptu_cgpa_tracker/screens/home.dart';

class Result extends StatelessWidget {
  const Result(this.cgpa);

  final double cgpa;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "CGPA",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway',
            fontSize: size.height * 0.027,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            if (cgpa >= 0 && cgpa <= 5)
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(children: [
                  Center(
                    child: Lottie.asset(
                      "assets/progress.json",
                      height: 300,
                      width: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
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
                            fontFamily: 'Raleway'),
                        children: <TextSpan>[
                          TextSpan(
                            text: cgpa.toStringAsFixed(2),
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 50,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ])),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Text(
                      "Every failure is a step to success. "
                      "Aim for more marks",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
            if (cgpa > 5 && cgpa <= 7)
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(children: [
                  Center(
                    child: Lottie.asset(
                      "assets/success.json",
                      height: 300,
                      width: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
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
                            fontFamily: 'Raleway'),
                        children: <TextSpan>[
                          TextSpan(
                            text: cgpa.toStringAsFixed(2),
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 50,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ])),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(
                      "Be consistent on your learning ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
            if (cgpa > 7 && cgpa <= 9)
              Padding(
                padding: EdgeInsets.only(top: 10),
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
                            fontFamily: 'Raleway'),
                        children: <TextSpan>[
                          TextSpan(
                            text: cgpa.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ])),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Text(
                      "Congraluations!                           "
                      "You are at the one step behind the success",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
            if (cgpa > 9 && cgpa <= 10)
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(children: [
                  Center(
                    child: Lottie.asset(
                      "assets/trophy.json",
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
                            fontFamily: 'Raleway'),
                        children: <TextSpan>[
                          TextSpan(
                            text: cgpa.toStringAsFixed(2),
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 50,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ])),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Text(
                      "Sawadekha! Happy now?                           "
                      "Hard work never fails",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
            SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: () {
                print(cgpa);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Container(
                child: Center(
                    child: Text(
                  "Go to Homepage",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: size.height * 0.025,
                      fontFamily: 'Raleway',
                      letterSpacing: size.height * 0.002),
                )),
                width: size.width * 0.6,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepOrange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
