import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutuscom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepOrange,
          title: Text(
            'ABOUT US',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Raleway',
              fontSize: size.height * 0.027,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
        body: ListView(children: [
          SizedBox(
            height: 32,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 230,
                width: 320,
                child: Card(
                  color: Colors.white12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        radius: 45,
                        child: CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage('assets/456.jpg'),
                        ),
                      ),
                      title: Text(
                        'THAMIZHARASAN  G',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(27, 10, 20, 10),
                        child: Text.rich(TextSpan(
                            text: '',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              TextSpan(
                                text: '',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'C language. "',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ]))),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 10),
                            child: IconButton(
                              // icon: Icon(),

                              onPressed: () => launch(
                                  'https://www.linkedin.com/in/thamizh-arasan-b48746208'),
                              iconSize: 30,
                              color: Colors.deepOrange,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14, right: 10),
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.linkedinIn),
                              onPressed: () => {},
                              iconSize: 30,
                              color: Colors.deepOrange,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14, right: 10),
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.github),
                              onPressed: () {},
                              iconSize: 30,
                              color: Colors.deepOrange,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14, right: 8),
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.whatsapp),
                              onPressed: () {},
                              iconSize: 30,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ])
                  ]),
                ),
              )),
        ]));
  }
}
