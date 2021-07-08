import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lottie Animation',
      home: NoInternet(),
    );
  }
}

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: Scaffold(
        backgroundColor: Colors.grey[850],
        body: SingleChildScrollView(
          child: ConnectivityWidgetWrapper(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 60, bottom: 10, right: 160),
                    child: Text(
                      'PTU CGPA TRACKER',
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18, top: 80, right: 18),
                    child: SizedBox(
                      height: 400.0,
                      width: 400.0,
                      child: Image.asset('assets/no.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, bottom: 50),
                    child: Text(
                      'No internet connection',
                      style: GoogleFonts.raleway(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
