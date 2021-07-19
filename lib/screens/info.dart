import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: Text(
          "About App",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway',
            fontSize: size.height * 0.027,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Share.share(
                "Check out this cool app \nhttps://play.google.com/store/apps/details?id=com.princeappstudio.ptu_cgpa_tracker",
              );
            },
            icon: Icon(
              Icons.share_rounded,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {
              launch(
                "https://play.google.com/store/apps/details?id=com.princeappstudio.ptu_cgpa_tracker",
              );
            },
            icon: Icon(
              Icons.star_rounded,
              size: 32,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "aboutApp",
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SvgPicture.asset(
                  "assets/info.svg",
                  fit: BoxFit.contain,
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'PTU CGPA TRACKER helps the PTU students to calculate their current CGPA with just tapping the grades they secured. Make sure that you have checked Honor/Minor and Open Elective check box if you have any before proceeding to calculate',
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'It is easy and quick app to generate the CGPA for current semester .',
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'CGPA is referred to as a cumulative grade point average. CGPA gives the average grade point of the student performance in all the subjects including the additional subject such as honour and minors when the students have.The subject wise performance of the students is recorded in form of Grades.',
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'The CGPA is used to denote the overall performance of the student in the academic session as grades. The CGPA system was introduced to ease the burden of marks and the stress of the examinations among students.  So to reduce the work for calculation we introduced the cgpa calculator for PTU students. This will make the calculation in user friendly manner.',
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
