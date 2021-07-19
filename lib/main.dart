import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ptu_cgpa_tracker/screens/home.dart';
import 'package:ptu_cgpa_tracker/screens/intro.dart';
import 'package:ptu_cgpa_tracker/screens/on_board.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.updateRequestConfiguration(
    RequestConfiguration(
      testDeviceIds: ["4603548B2FE5102EF89FAAB3102DE469"],
    ),
  );
  MobileAds.instance.initialize();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showIntro = true;
  bool showOnBoard = true;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      showIntro = sharedPreferences.get("showIntro") ?? true;
      showOnBoard = sharedPreferences.get("showOnBoard") ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Raleway'),
        accentColor: Colors.deepOrangeAccent,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.deepOrange;
              }
              return Colors.deepOrange;
            },
          ),
        ),
      ),
      home: showIntro
          ? Intro(
              viewIntro: false,
            )
          : showOnBoard
              ? OnBoard(
                  fromHome: false,
                )
              : Home(),
    );
  }
}
