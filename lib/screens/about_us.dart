import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: Text(
          "DEVELOPERS",
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
      body: ListView(
        children: [
          SizedBox(
            height: 32,
          ),
          Hero(
            tag: "aboutUs",
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: SvgPicture.asset(
                "assets/aboutUs.svg",
                fit: BoxFit.contain,
                height: 200,
                width: 200,
              ),
            ),
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
                          backgroundImage: AssetImage('assets/thamizh.jpg'),
                        ),
                      ),
                      title: Text(
                        'THAMIZHARASAN  G',
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(27, 10, 20, 10),
                        child: Text.rich(TextSpan(
                            text: '" Beginner in  ',
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Flutter , ',
                                style: TextStyle(
                                  fontFamily: "Raleway",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'to build an apps for Android. A learning coder in ',
                                style: TextStyle(
                                  fontFamily: "Raleway",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'C language. "',
                                style: TextStyle(
                                  fontFamily: "Raleway",
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
                      contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        radius: 45,
                        child: CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage('assets/yadava.jpg'),
                        ),
                      ),
                      title: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 13, 10),
                        child: Text(
                          'YADHAVA PRASANNA  G',
                          style: TextStyle(
                            fontFamily: "Raleway",
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
                            text: '" A Passionate coder who interested in  ',
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'developing apps , ',
                                style: TextStyle(
                                  fontFamily: "Raleway",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              TextSpan(
                                text: 'using ',
                                style: TextStyle(
                                  fontFamily: "Raleway",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'Flutter. "',
                                style: TextStyle(
                                  fontFamily: "Raleway",
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
                              onPressed: () =>
                                  launch('https://github.com/yadhavaprasanna'),
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
                          backgroundImage: AssetImage('assets/sanjivy.jpg'),
                        ),
                      ),
                      title: Text(
                        'PRINCE  SANJIVY',
                        style: TextStyle(
                          fontFamily: "Raleway",
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
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Python ',
                                style: TextStyle(
                                  fontFamily: "Raleway",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ', who loves to build apps and games for Android and Web. "',
                                style: TextStyle(
                                  fontFamily: "Raleway",
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
                              onPressed: () =>
                                  launch('https://github.com/princesanjivy'),
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
                          backgroundImage: AssetImage('assets/yuva.jpeg'),
                        ),
                      ),
                      title: Text(
                        'YUVACHANDIRAN',
                        style: TextStyle(
                          fontFamily: "Raleway",
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
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Programmer "',
                                style: TextStyle(
                                  fontFamily: "Raleway",
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
                          backgroundImage: AssetImage('assets/ashok.jpg'),
                        ),
                      ),
                      title: Text(
                        'ASHOK  A',
                        style: TextStyle(
                          fontFamily: "Raleway",
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
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '{ print("Python Beginner") } "',
                                style: TextStyle(
                                  fontFamily: "Raleway",
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
