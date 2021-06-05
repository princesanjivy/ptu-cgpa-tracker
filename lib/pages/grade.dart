import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ptu_cgpa_tracker/components/gradeselection.dart';

class GradePage extends StatelessWidget {
  const GradePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshots) {
        return MaterialApp(
          title: "CGPA",
          home: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('IT').snapshots(),
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              // Text(snapshots.data.docs[1]['credit'].toString()),
              return Scaffold(body: GradeSelection());
            },
          ),
        );
      },
    );
  }
}
