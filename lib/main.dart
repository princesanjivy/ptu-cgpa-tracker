import 'package:flutter/material.dart';
import 'package:ptu_cgpa_tracker/pages/homepage.dart';

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
      home: SharedPreferenceDemo(),
      /* initialRoute: '/h',
      routes: {
        '/h': (context) => Home(),
        
      },*/
    );
  }
}
