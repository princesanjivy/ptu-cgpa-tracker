import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/home.dart';
import 'package:gpa/suma.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Raleway',
            ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return Colors
                    .deepOrange; // the color when checkbox is selected;
              }
              return Colors.deepOrange; //the color when checkbox is unselected;
            },
          ),
        ),
      ),
      home: Homepage(),
      /* initialRoute: '/h',
      routes: {
        '/h': (context) => Home(),
        
      },*/
    );
  }
}

class Data {
  final String dept;

  Data(this.dept);
}

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String choosedept;
  SharedPreferences prefs;
  final _key = 'cur_r';

  //TextEditingController semester = new TextEditingController();
  // String savedtext = "";

  /*SharedPreferences prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name2') ??
        "Electronics and Communications Engineering ";*/

  @override
  void initState() {
    super.initState();
    _read();
    _write();
  }

  _read() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      choosedept = prefs.getString(_key) ??
          "Electronics and Communications Engineering ";
    });
  }

  _write() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name2') ??
        "Electronics and Communications Engineering ";
  }

  bool honor = false;
  bool oe = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'PTU GPA TRACKER',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Raleway',
              fontSize: size.height * 0.027,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: Center(child: Image.asset('images/mee1.png')),
            ),
            SizedBox(
              height: size.height * 0.02,
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
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: DropdownButton<String>(
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
                    iconSize: size.height * 0.03,
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
              height: size.height * 0.037,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55, right: 55),
              child: Container(
                  padding: EdgeInsets.only(left: 26, right: 26),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: TextFormField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Current Semester',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: size.height * .02,
                          fontFamily: 'raleway'),
                    ),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.height * .02,
                        fontFamily: 'raleway'),
                  ))),
            ),
            /* SizedBox(
              height: size.height * 0.1,
            ),*/
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          activeColor: Colors.deepOrange,
                          // checkColor: Colors.white,
                          tristate: false,
                          value: honor,
                          onChanged: (bool value) {
                            setState(() {
                              honor = value;
                            });
                          }),
                      Text("Honor/minor",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          activeColor: Colors.deepOrange,
                          value: oe,
                          onChanged: (bool value) {
                            setState(() {
                              oe = value;
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
              height: size.height * 0.035,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Home(data: Data(choosedept))));
              },
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.37,
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
            /*   Text(
              "$choosedept",
              style: TextStyle(color: Colors.white),
            )*/
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = [
      'Electronics and Communications Engineering ',
      'Computer Science Engineering ',
      'Information Technology ',
      'Mechanical Engineering ',
      'Chemical Engineering ',
      'Electronics and Instrumentation Engineering ',
      'Civil Engineering '
          'Electrical and Electronics Engineering'
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }
}

class Home extends StatelessWidget {
  final Data data;
  Home({@required this.data, Key key}) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'PTU GPA TRACKER',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Raleway',
              fontSize: size.height * 0.027,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Allow PEC students to calculate their CGPA,keep track of current semester's CGPA so that it will give overall CGPA and current sem's CGPA,in addition to that,department wise CGPA rank system overall & per semester",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'raleway',
                    fontSize: size.height * 0.029,
                    letterSpacing: size.height * 0.001),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'current cgpa :',
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
                  'yes',
                  style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, .5),
                          blurRadius: 1.0,
                          color: Colors.white,
                        ),
                      ],
                      color: Colors.deepOrange,
                      fontSize: size.height * .017,
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
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0, .5),
                            blurRadius: 1.0,
                            color: Colors.white,
                          ),
                        ],
                        color: Colors.deepOrange,
                        fontSize: size.height * .017,
                        fontFamily: 'raleway'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(child: Image.asset('images/mee1.png')),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            Container(
              child: Center(
                  child: Text(
                "Calculate CGPA",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: size.height * 0.025,
                    fontFamily: 'Raleway',
                    letterSpacing: size.height * 0.002),
              )),
              width: size.width * 0.6,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepOrange),
            )
          ],
        ),
      ),
    );
  }
}
