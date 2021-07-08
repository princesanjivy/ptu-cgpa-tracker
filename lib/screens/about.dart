// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:share/share.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class AboutUs extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.deepOrange,
//         title: Text(
//           "ABOUT US",
//           style: TextStyle(
//             color: Colors.white,
//             fontFamily: 'Raleway',
//             fontSize: size.height * 0.027,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.5,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Share.share(
//                 "Check out this cool app \nhttps://play.google.com/store/apps/details?id=com.princeappstudio.ptu_cgpa_tracker",
//               );
//             },
//             icon: Icon(
//               Icons.share_rounded,
//               size: 28,
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               launch(
//                 "https://play.google.com/store/apps/details?id=com.princeappstudio.ptu_cgpa_tracker",
//               );
//             },
//             icon: Icon(
//               Icons.star_rounded,
//               size: 32,
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.white12,
//                     width: 10,
//                   ),
//                 ),
//                 child: Image.asset(
//                   'assets/undraw_Calculator_0evy.png',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.fromLTRB(40, 10, 40, 20),
//               child: Text(
//                 'Allow PEC students to calculate their CGPA, keep track of current semester’s CGPA so that it will give overall CGPA and current sem’s CGPA, in addition to that, department wise CGPA rank system overall & per semester',
//                 style: GoogleFonts.raleway(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.deepOrange,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.fromLTRB(40, 10, 40, 20),
//               child: Text(
//                 'It is easy and quick app to generate the CGPA for all semester and current semester',
//                 style: GoogleFonts.raleway(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.deepOrange,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
