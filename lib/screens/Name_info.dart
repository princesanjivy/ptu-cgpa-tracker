// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:share/share.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Nameinfo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.deepOrange,
//         title: Text(
//           "About",
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
//                 'PTU CGPA TRACKER helps the PTU students to calculate their current CGPA with just tapping the grades they secured. Make sure that you have checked Honor/Minor and Open Elective check box if you have any before proceeding to calculate',
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
//                 'It is easy and quick app to generate the CGPA for current semester',
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
