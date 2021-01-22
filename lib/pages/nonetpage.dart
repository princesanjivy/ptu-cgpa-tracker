import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lottie Animation',
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: Text(
            'Lottie Animation',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32.0,
            ),
          ),
        ),
        body: Center(
          child: SizedBox(
            height: 300.0,
            width: 300.0,
            child: Lottie.network(
                'https://assets8.lottiefiles.com/packages/lf20_HX0isy.json'),
          ),
        ),
      ),
    );
  }
}
