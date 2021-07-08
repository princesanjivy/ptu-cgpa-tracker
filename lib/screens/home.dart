import 'package:flutter/material.dart';
import 'package:ptu_cgpa_tracker/screens/grade.dart';
import 'package:ptu_cgpa_tracker/screens/on_board.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  final Data data;

  Home({@required this.data, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: Text(
          'HOME',
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Center(
                  child: Image.asset(
                    'images/Component.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Semester :',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'raleway',
                          fontSize: size.height * 0.025,
                          letterSpacing: size.height * 0.001),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    '${data.sem}',
                    style: TextStyle(
                        letterSpacing: 2,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0, .5),
                            blurRadius: 1.0,
                            color: Colors.white,
                          ),
                        ],
                        color: Colors.deepOrange,
                        fontSize: size.height * .03,
                        fontFamily: 'raleway'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    Text(
                      'Department :',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'raleway',
                          fontSize: size.height * 0.025,
                          letterSpacing: size.height * 0.001),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      " ${data.dept}",
                      style: TextStyle(
                          letterSpacing: 3,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0, .5),
                              blurRadius: 1.0,
                              color: Colors.white,
                            ),
                          ],
                          color: Colors.deepOrange,
                          fontSize: size.height * .03,
                          fontFamily: 'raleway'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(32),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GradePage(
                        key, data.dept, data.sem, data.honor, data.oe)));
              },
              child: Container(
                child: Center(
                    child: Text(
                  "Calculate",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: size.height * 0.025,
                      fontFamily: 'Raleway',
                      letterSpacing: size.height * 0.002),
                )),
                width: size.width * 0.4,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepOrange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
