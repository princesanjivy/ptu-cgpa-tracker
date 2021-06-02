import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:lottie/lottie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
        app: MaterialApp(
      title: 'Lottie Animation',
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        body: ConnectivityWidgetWrapper(
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
                // Padding(
                //   padding: EdgeInsets.only(top: 0, right: 160),
                //  child: CircleAvatar(
                //  backgroundImage: AssetImage(
                //  'assets/logo.jpg',
                //),
                //radius: 30,
                //)),
                Padding(
                  padding: EdgeInsets.only(left: 18, top: 80, right: 18),
                  child: SizedBox(
                    height: 400.0,
                    width: 400.0,
                    child: Image.asset('assets/no.webp'),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 8, bottom: 5),
                //   child: Text(
                //     'There is no internet connection',
                //     style: GoogleFonts.poppins(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
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
    ));
  }
}
