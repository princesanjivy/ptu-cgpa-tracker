import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEVELOPERS',
      debugShowCheckedModeBanner: false,
      home: Developer(),
    );
  }
}

class Developer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: Text(
          'ABOUT US',
          style: GoogleFonts.raleway(
              textStyle: TextStyle(
            color: Colors.deepOrange,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          )),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(top: 50, bottom: 20, left: 30, right: 25),
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
                                text: '" A beginning coder in ',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Flutter , ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'to build an apps for Android. A learning coder in ',
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
                                  icon: Icon(FontAwesomeIcons.instagram),
                                  onPressed: () => launch(
                                      'https://www.instagram.com/thamizh813813/'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 10),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.linkedinIn),
                                  onPressed: () => launch(
                                      'https://www.linkedin.com/in/thamizh-arasan-b48746208'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 10),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.github),
                                  onPressed: () =>
                                      launch('https://github.com/Thamizh813'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 8),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.whatsapp),
                                  onPressed: () => launch(
                                      'https://api.whatsapp.com/send?phone= +919597164167&text=Hello Thamizharasan'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ])
                      ]),
                    ),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 25),
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
                          contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepOrange,
                            radius: 45,
                            child: CircleAvatar(
                              radius: 26,
                              backgroundImage: AssetImage('assets/yadav.jpg'),
                            ),
                          ),
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 13, 10),
                            child: Text(
                              'YADHAVA PRASSANA  G',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(27, 10, 20, 10),
                            child: Text.rich(TextSpan(
                                text:
                                    '" A Passionate coder who interested in  ',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'developing apps , ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'using ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Flutter. "',
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
                                  icon: Icon(FontAwesomeIcons.instagram),
                                  onPressed: () => launch(
                                      'https://instagram.com/y.a.d.a.v.a_1618?igshid=g9a0nmhcn6t4'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 10),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.mailBulk),
                                  onPressed: _sendMailstoYadava,
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 10),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.github),
                                  onPressed: () => launch(
                                      'https://github.com/yadhavaprasanna'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 8),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.whatsapp),
                                  onPressed: () => launch(
                                      'https://api.whatsapp.com/send?phone= +916369591791&text=Hello Yadhava prassana'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ])
                      ]),
                    ),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 25),
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
                              backgroundImage: AssetImage('assets/sanj.jpg'),
                            ),
                          ),
                          title: Text(
                            'PRINCE  SANJIVY',
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
                                text: '" A passionate coder in ',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Python ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ', who loves to build apps and games for Android and Web. "',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ]))),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.instagram),
                                  onPressed: () => launch(
                                      'https://www.instagram.com/princesanjivy'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 10),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.facebook),
                                  onPressed: () => launch(
                                      'https://www.facebook.com/PrinceSanjivy'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 10),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.github),
                                  onPressed: () => launch(
                                      'https://github.com/princesanjivy'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 8),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.globeAmericas),
                                  onPressed: () => launch(
                                      'https://princesanjivy-portfolio.web.app/'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ])
                      ]),
                    ),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 25),
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
                              backgroundImage: AssetImage('assets/yuva.jpeg'),
                            ),
                          ),
                          title: Text(
                            'YUVACHANDIRAN',
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
                                text: '" A lifelong learner and self thought ',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Programmer "',
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
                                  icon: Icon(FontAwesomeIcons.instagram),
                                  onPressed: () => launch(
                                      'https://instagram.com/yuvachn?igshid=1f34azj7e1ntv'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 10),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.linkedinIn),
                                  onPressed: () => launch(
                                      "https://www.linkedin.com/mwlite/in/yuva-chn-1621b4201"),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 10),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.github),
                                  onPressed: () =>
                                      launch("https://github.com/yuvachn"),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 8),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.whatsapp),
                                  onPressed: () => launch(
                                      'https://api.whatsapp.com/send?phone= +916380032347&text=Hello Yuvachandiran'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ])
                      ]),
                    ),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 40, left: 30, right: 25),
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
                              backgroundImage: AssetImage('assets/ashok.jpg'),
                            ),
                          ),
                          title: Text(
                            'ASHOK  A',
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
                                text: '" A Intermediate Web Developer AND ,',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '{ print("Python Beginner") } "',
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
                                  icon: Icon(FontAwesomeIcons.instagram),
                                  onPressed: () => launch(
                                      'https://instagram.com/ashokangappan?igshid=1o8wxd2k328m4'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 10),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.linkedinIn),
                                  onPressed: () => launch(
                                      'https://www.linkedin.com/in/ashok-angappan-207754151'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 10),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.github),
                                  onPressed: () =>
                                      launch('https://github.com/Ashok-AK-lab'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 8),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.whatsapp),
                                  onPressed: () => launch(
                                      'https://api.whatsapp.com/send?phone= +917094206801&text=Hello Ashok'),
                                  iconSize: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ])
                      ]),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

_sendMailstoYadava() async {
  const url = 'mailto:yadavaprasanna16@gmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
