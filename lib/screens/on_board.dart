import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptu_cgpa_tracker/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  final String dept;
  final String sem;
  final bool honor;
  final bool oe;

  Data(this.dept, this.sem, this.honor, this.oe);
}

class OnBoard extends StatefulWidget {
  OnBoard({Key key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  String choosesem;
  String choosedept;
  SharedPreferences prefs;
  final _key = 'cur_r';
  // final keys = 'cur';
  // SharedPreferences prefss;
  /* _read() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      choosedept = prefs.getString(_key) ?? "Computer Science Engineering";
    });
  }

  _readsem() async {
    prefss = await SharedPreferences.getInstance();
    setState(() {
      choosesem = prefss.getString(keys) ?? '1';
    });
  }*/
  @override
  void initState() {
    super.initState();
    _read();
    // _readsem();
  }

  _read() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      choosedept = prefs.getString(_key) ?? "IT";
    });
  }

  /*_readsem() async {
    prefss = await SharedPreferences.getInstance();
    setState(() {
    //  choosesem = prefss.getString(keys) ?? '';
    });
  }*/

  bool honor = false;
  bool oe = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepOrange,
          title: Text(
            'PTU GPA TRACKER',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Raleway',
              fontSize: size.height * 0.027,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.only(top: 28),
                child: SvgPicture.asset(
                  "assets/onBoard.svg",
                  fit: BoxFit.contain,
                  height: 200,
                  width: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 55,
                  right: 55,
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 26, right: 26),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepOrange,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.black.withOpacity(.85),
                      elevation: 24,
                      hint: Text(
                        'Choose your Department',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * .02,
                            fontFamily: 'raleway'),
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      iconSize: size.height * 0.04,
                      underline: SizedBox(),
                      isExpanded: true,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.height * .02,
                          fontFamily: 'raleway'),
                      value: choosedept,
                      items: _dropDownItem(),
                      onChanged: (value) {
                        setState(() {
                          choosedept = value;
                        });
                        prefs.setString(_key, choosedept);
                        choosedept = value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 55,
                  right: 55,
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 26, right: 26),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepOrange,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.black.withOpacity(.9),
                      elevation: 24,
                      hint: Text(
                        'Choose your semester',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: size.height * .02,
                            fontFamily: 'raleway'),
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      iconSize: size.height * 0.04,
                      underline: SizedBox(),
                      isExpanded: true,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.height * .02,
                          fontFamily: 'raleway'),
                      value: choosesem,
                      items: _dropDownItemsem(),
                      onChanged: (value) {
                        setState(() {
                          choosesem = value;
                        });
                        //prefss.setString(_key, choosesem);
                        choosesem = value;
                      },
                    ),
                  ),
                ),
              ),
              /* Text(
              "$choosesem",
              style: TextStyle(color: Colors.white),
            )*/
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.deepOrange,
                            // checkColor: Colors.white,
                            tristate: false,
                            value: honor,
                            onChanged: (bool value) {
                              setState(() {
                                honor = value;
                                print(honor);
                              });
                            }),
                        Text("Honor/Minor",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.deepOrange,
                            value: oe,
                            onChanged: (bool value) {
                              setState(() {
                                oe = value;
                                print(oe);
                              });
                            }),
                        Text(
                          "Open Elective",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Home(
                        data: Data(choosedept, choosesem, honor, oe),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: size.height * 0.025,
                        fontFamily: 'Raleway',
                        letterSpacing: size.height * 0.002),
                  )),
                ),
              ),
            ],
          ),
        ));
  }

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = [
      "ECE",
      "CSE",
      "IT",
      "MEC",
      "CHE",
      "EIE",
      "CIE",
      "EEE",
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _dropDownItemsem() {
    List<String> ddl1 = ['1', '2', '3', '4', '5', '6', '7', '8'];
    return ddl1
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }
}