import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme),
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Navdrawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Ptu Cgpa Tracker',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Navdrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Text('CGPA CALCULATOR',
                  style: GoogleFonts.raleway(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  )),
              decoration: BoxDecoration(
                color: Colors.black,
                //   image: DecorationImage(
                // fit: BoxFit.fill,
                // // image: AssetImage(
                // //   'assets/header.png',
                // // ),
              )),
          ListTile(
            onTap: () {},
            leading: Icon(
              FontAwesomeIcons.home,
              color: Colors.black,
            ),
            title: Text(
              'MORE APPS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.deepOrange,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              FontAwesomeIcons.infoCircle,
              color: Colors.black,
            ),
            title: Text(
              'ABOUT',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.deepOrange,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              FontAwesomeIcons.dev,
              color: Colors.black,
            ),
            title: Text(
              'DEVELOPER',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.deepOrange,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              FontAwesomeIcons.dev,
              color: Colors.black,
            ),
            title: Text(
              'RATE AND REVIEW',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.deepOrange,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              FontAwesomeIcons.dev,
              color: Colors.black,
            ),
            title: Text(
              'APRM INONU',
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepOrange,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
