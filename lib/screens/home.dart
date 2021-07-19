import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptu_cgpa_tracker/components/my_card.dart';
import 'package:ptu_cgpa_tracker/screens/about_us.dart';
import 'package:ptu_cgpa_tracker/screens/grade.dart';
import 'package:ptu_cgpa_tracker/screens/info.dart';
import 'package:ptu_cgpa_tracker/screens/intro.dart';
import 'package:ptu_cgpa_tracker/screens/on_board.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  // final Data data;

  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences prefs;
  final Map roman = {
    "1": "I",
    "2": "II",
    "3": "III",
    "4": "IV",
    "5": "V",
    "6": "VI",
    "7": "VII",
  };

  String chooseDept = "";
  String chooseSem = "";
  bool honor = false;
  bool oe = false;

  @override
  void initState() {
    super.initState();

    read();
  }

  read() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      chooseDept = prefs.getString("chooseDept") ?? "IT";
      chooseSem = prefs.getString("chooseSem") ?? "3";
      honor = prefs.getBool("isHonor") ?? false;
      oe = prefs.getBool("isOe") ?? false;
    });
  }

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
                padding: EdgeInsets.only(top: 16),
                child: SvgPicture.asset(
                  "assets/logo.svg",
                  fit: BoxFit.contain,
                  height: 200,
                  width: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 8,
                  bottom: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Semester: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      roman[chooseSem],
                      style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0, 0.5),
                            blurRadius: 1,
                            color: Colors.white,
                          ),
                        ],
                        color: Colors.deepOrange,
                        fontSize: size.height * 0.025,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 8,
                  bottom: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Department: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "$chooseDept",
                      style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0, 0.5),
                            blurRadius: 1,
                            color: Colors.white,
                          ),
                        ],
                        color: Colors.deepOrange,
                        fontSize: size.height * 0.025,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ],
                ),
              ),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(16),
                children: [
                  MyCustomCard(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OnBoard(
                            fromHome: true,
                          ),
                        ),
                      );
                    },
                    tag: "onBoard",
                    title: "Change details",
                    illustrationPath: "assets/onBoard.svg",
                  ),
                  MyCustomCard(
                    onTap: () {
                      launch(
                        "https://play.google.com/store/apps/dev?id=6439925551269057866",
                      );
                    },
                    tag: "moreApps",
                    title: "More apps",
                    illustrationPath: "assets/moreApps.svg",
                  ),
                  MyCustomCard(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AboutUs(),
                        ),
                      );
                    },
                    tag: "aboutUs",
                    title: "Developers",
                    illustrationPath: "assets/aboutUs.svg",
                  ),
                  MyCustomCard(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Intro(
                            viewIntro: true,
                          ),
                        ),
                      );
                    },
                    tag: "appIntro",
                    title: "App Intro",
                    illustrationPath: "assets/intro1.svg",
                  ),
                  MyCustomCard(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Info(),
                        ),
                      );
                    },
                    tag: "aboutApp",
                    title: "About App",
                    illustrationPath: "assets/info.svg",
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 16,
              //   ),
              //   child: Wrap(
              //     alignment: WrapAlignment.start,
              //     runSpacing: 16,
              //     spacing: 16,
              //     children: [
              //       Container(
              //         width: size.width / 2.5,
              //         height: 100,
              //         padding: EdgeInsets.all(.2),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(15),
              //             gradient: LinearGradient(
              //                 colors: [Colors.black, Colors.white],
              //                 begin: Alignment.centerLeft,
              //                 end: Alignment.centerRight)),
              //         child: Container(
              //           width: size.width / 2.5,
              //           height: 100,
              //           padding: EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15),
              //               color: Colors.black),
              //           child: Text(
              //             "More Apps",
              //             style: TextStyle(
              //                 color: Colors.white,
              //                 fontFamily: 'Raleway',
              //                 fontSize: size.height * 0.020,
              //                 letterSpacing: size.height * 0.001),
              //           ),
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Navigator.of(context).push(
              //             MaterialPageRoute(
              //               builder: (context) => AboutUs(),
              //             ),
              //           );
              //         },
              //         child: Container(
              //           width: size.width / 2.5,
              //           height: 100,
              //           padding: EdgeInsets.all(.2),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15),
              //               gradient: LinearGradient(
              //                   colors: [Colors.black, Colors.white],
              //                   begin: Alignment.centerLeft,
              //                   end: Alignment.centerRight)),
              //           child: Container(
              //             width: size.width / 2.5,
              //             height: 100,
              //             padding: EdgeInsets.all(10),
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(15),
              //                 color: Colors.black),
              //             child: Text(
              //               "About Us",
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontFamily: 'Raleway',
              //                   fontSize: size.height * 0.020,
              //                   letterSpacing: size.height * 0.001),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(32),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GradePage(
                      widget.key,
                      chooseDept,
                      chooseSem,
                      honor,
                      oe,
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: EdgeInsets.all(4),
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
          ),
        ],
      ),
    );
  }
}
