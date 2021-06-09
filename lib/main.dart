import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ptu_cgpa_tracker/pages/grade.dart';
import 'package:ptu_cgpa_tracker/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GradePage());
}

// class MyRootApp extends StatefulWidget {
//   MyRootApp({Key key}) : super(key: key);

//   @override
//   _MyRootAppState createState() => _MyRootAppState();
// }

// class _MyRootAppState extends State<MyRootApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "PTU CGPA Tracker",
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(
//           Theme.of(context).textTheme,
//         ),
//       ),
//       home: GradePage(),
//     );
//   }
// }
