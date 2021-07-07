import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ptu_cgpa_tracker/screens/on_board.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: OnBoard(),

      /// Intro has to come!!!
    );
  }
}
