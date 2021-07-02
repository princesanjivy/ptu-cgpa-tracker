import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ptu_cgpa_tracker/components/gradeselection.dart';

class GradePage extends StatefulWidget {
  GradePage(Key key, this.dept, this.sem, this.honor, this.oe)
      : super(key: key);
  final String dept;
  final String sem;
  final bool honor;
  final bool oe;
  @override
  _GradePageState createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  @override
  void initState() {
    super.initState();

    // _readsem();
  }

  double creditsum = 0.0;

  double cgpa = 0;

  double subsum = 0.0;

  int subcount = 0;

  int index1 = 0;

  int c = 0;

  bool unselect = false;

  bool _isActiveS = false;

  bool _isActiveA = false;

  bool _isActiveB = false;

  bool _isActiveC = false;

  bool _isActiveD = false;

  bool _isActiveE = false;

  bool _isActiveF = false;

  int x = 1;

  List<double> subject1 = [
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0
  ];

  List<double> score = [
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
  ];

  List<double> credit = [
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
  ];

  void dummy() {
    print("subject1=$subject1");
    print("score  $score");
    print("credit  $credit");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshots) {
        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(widget.dept)
              .where("semester", isEqualTo: widget.sem)
              .snapshots(),
          builder: (context, snapshots) {
            if (x == 1 &&
                snapshots.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // String k = snapshots.data.docs[0].data()['course'];
            // if (snapshots.hasData) {
            //   print(k);
            // }

            return Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  title: Text("CGPA"),
                  backgroundColor: Colors.deepOrange,
                ),
                body: Column(
                  children: [
                    Container(
                      height: 600,
                      width: 800,
                      child: ListView.builder(
                          itemCount: snapshots.data.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                padding: EdgeInsets.all(.2),
                                height: 100,
                                width: 340,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        colors: [Colors.black, Colors.white],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              snapshots.data.docs[index]
                                                  ['course'],
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 6,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    x = 2;
                                                    index1 = index;

                                                    _isActiveS = true;

                                                    if (index == index1) {
                                                      subject1[index] = 10.0;
                                                      credit[index] =
                                                          double.parse(snapshots
                                                                  .data
                                                                  .docs[index]
                                                              ['credit']);
                                                      score[index] =
                                                          (credit[index] *
                                                              subject1[index]);

                                                      // _isActiveA = false;
                                                      // _isActiveB = false;
                                                      // _isActiveC = false;
                                                      // _isActiveD = false;
                                                      // _isActiveE = false;
                                                      // _isActiveF = false;
                                                      dummy();
                                                    }
                                                    print(credit[index]);
                                                    print(double.parse(snapshots
                                                                .data
                                                                .docs[index]
                                                            ['credit']) *
                                                        subject1[index]);
                                                    print("index=$index");
                                                    print("index1= $index1");
                                                  });
                                                },
                                                onDoubleTap: () {
                                                  setState(() {
                                                    index1 = index;

                                                    _isActiveS = !_isActiveS;
                                                    subject1[index] = 1.0;
                                                    score[index] = 1.0;
                                                    credit[index] = 0.0;
                                                    if (index1 == index) {
                                                      _isActiveS = !_isActiveS;
                                                    }

                                                    dummy();
                                                  });
                                                },
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: _isActiveS &&
                                                          subject1[index] >
                                                              0.0 &&
                                                          subject1[index] ==
                                                              10.0
                                                      ? Colors.deepOrange
                                                      : Colors.white,
                                                  child: CircleAvatar(
                                                    radius: 19,
                                                    backgroundColor:
                                                        _isActiveS &&
                                                                subject1[
                                                                        index] >
                                                                    0.0 &&
                                                                subject1[
                                                                        index] ==
                                                                    10.0
                                                            ? Colors.white
                                                            : Colors.deepOrange,
                                                    child: Text(
                                                      "S",
                                                      style: TextStyle(
                                                          fontSize: 23,
                                                          color: _isActiveS &&
                                                                  subject1[
                                                                          index] >
                                                                      0.0 &&
                                                                  subject1[
                                                                          index] ==
                                                                      10.0
                                                              ? Colors
                                                                  .deepOrange
                                                              : Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    x = 2;
                                                    index1 = index;

                                                    _isActiveA = true;

                                                    if (index == index1) {
                                                      subject1[index] = 9;
                                                      credit[index] =
                                                          double.parse(snapshots
                                                                  .data
                                                                  .docs[index]
                                                              ['credit']);
                                                      score[index] =
                                                          (credit[index] *
                                                              subject1[index]);

                                                      // _isActiveS = false;
                                                      // _isActiveB = false;
                                                      // _isActiveC = false;
                                                      // _isActiveD = false;
                                                      // _isActiveE = false;
                                                      // _isActiveF = false;
                                                      dummy();
                                                    }
                                                    print("index=$index");
                                                    print("index1= $index1");
                                                  });
                                                },
                                                onDoubleTap: () {
                                                  setState(() {
                                                    index1 = index;

                                                    _isActiveA = !_isActiveA;
                                                    subject1[index] = 0;
                                                    score[index] = 1.0;
                                                    credit[index] = 0.0;
                                                    if (index1 == index) {
                                                      _isActiveA = !_isActiveA;
                                                    }

                                                    dummy();
                                                  });
                                                },
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: _isActiveA &&
                                                          subject1[index] > 0 &&
                                                          subject1[index] == 9
                                                      ? Colors.deepOrange
                                                      : Colors.white,
                                                  child: CircleAvatar(
                                                    radius: 19,
                                                    backgroundColor:
                                                        _isActiveA &&
                                                                subject1[
                                                                        index] >
                                                                    0 &&
                                                                subject1[
                                                                        index] ==
                                                                    9
                                                            ? Colors.white
                                                            : Colors.deepOrange,
                                                    child: Text(
                                                      "A",
                                                      style: TextStyle(
                                                          fontSize: 23,
                                                          color: _isActiveA &&
                                                                  subject1[
                                                                          index] >
                                                                      0 &&
                                                                  subject1[
                                                                          index] ==
                                                                      9
                                                              ? Colors
                                                                  .deepOrange
                                                              : Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    x = 2;
                                                    index1 = index;

                                                    _isActiveB = true;

                                                    if (index == index1) {
                                                      subject1[index] = 8;
                                                      credit[index] =
                                                          double.parse(snapshots
                                                                  .data
                                                                  .docs[index]
                                                              ['credit']);
                                                      score[index] =
                                                          (credit[index] *
                                                              subject1[index]);

                                                      // _isActiveS = false;
                                                      // _isActiveA = false;
                                                      // _isActiveC = false;
                                                      // _isActiveD = false;
                                                      // _isActiveE = false;
                                                      // _isActiveF = false;
                                                      dummy();
                                                    }
                                                    print("index=$index");
                                                    print("index1= $index1");
                                                  });
                                                },
                                                onDoubleTap: () {
                                                  setState(() {
                                                    index1 = index;

                                                    _isActiveB = !_isActiveB;
                                                    subject1[index] = 0;
                                                    score[index] = 1.0;
                                                    credit[index] = 0.0;
                                                    if (index1 == index) {
                                                      _isActiveB = !_isActiveB;
                                                    }

                                                    dummy();
                                                  });
                                                },
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: _isActiveB &&
                                                          subject1[index] > 0 &&
                                                          subject1[index] == 8
                                                      ? Colors.deepOrange
                                                      : Colors.white,
                                                  child: CircleAvatar(
                                                    radius: 19,
                                                    backgroundColor:
                                                        _isActiveB &&
                                                                subject1[
                                                                        index] >
                                                                    0 &&
                                                                subject1[
                                                                        index] ==
                                                                    8
                                                            ? Colors.white
                                                            : Colors.deepOrange,
                                                    child: Text(
                                                      "B",
                                                      style: TextStyle(
                                                          fontSize: 23,
                                                          color: _isActiveB &&
                                                                  subject1[
                                                                          index] >
                                                                      0 &&
                                                                  subject1[
                                                                          index] ==
                                                                      8
                                                              ? Colors
                                                                  .deepOrange
                                                              : Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    x = 2;
                                                    index1 = index;

                                                    _isActiveC = true;

                                                    if (index == index1) {
                                                      subject1[index] = 7;
                                                      credit[index] =
                                                          double.parse(snapshots
                                                                  .data
                                                                  .docs[index]
                                                              ['credit']);
                                                      score[index] =
                                                          (credit[index] *
                                                              subject1[index]);

                                                      // _isActiveS = false;
                                                      // _isActiveB = false;
                                                      // _isActiveA = false;
                                                      // _isActiveD = false;
                                                      // _isActiveE = false;
                                                      // _isActiveF = false;
                                                      dummy();
                                                    }
                                                    print("index=$index");
                                                    print("index1= $index1");
                                                  });
                                                },
                                                onDoubleTap: () {
                                                  setState(() {
                                                    index1 = index;

                                                    _isActiveC = !_isActiveC;
                                                    subject1[index] = 0;
                                                    score[index] = 1.0;
                                                    credit[index] = 0.0;
                                                    if (index1 == index) {
                                                      _isActiveC = !_isActiveC;
                                                    }

                                                    dummy();
                                                  });
                                                },
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: _isActiveC &&
                                                          subject1[index] > 0 &&
                                                          subject1[index] == 7
                                                      ? Colors.deepOrange
                                                      : Colors.white,
                                                  child: CircleAvatar(
                                                    radius: 19,
                                                    backgroundColor:
                                                        _isActiveC &&
                                                                subject1[
                                                                        index] >
                                                                    0 &&
                                                                subject1[
                                                                        index] ==
                                                                    7
                                                            ? Colors.white
                                                            : Colors.deepOrange,
                                                    child: Text(
                                                      "C",
                                                      style: TextStyle(
                                                          fontSize: 23,
                                                          color: _isActiveC &&
                                                                  subject1[
                                                                          index] >
                                                                      0 &&
                                                                  subject1[
                                                                          index] ==
                                                                      7
                                                              ? Colors
                                                                  .deepOrange
                                                              : Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    x = 2;
                                                    index1 = index;

                                                    _isActiveD = true;

                                                    if (index == index1) {
                                                      subject1[index] = 6;
                                                      credit[index] =
                                                          double.parse(snapshots
                                                                  .data
                                                                  .docs[index]
                                                              ['credit']);
                                                      score[index] =
                                                          (credit[index] *
                                                              subject1[index]);

                                                      // _isActiveS = false;
                                                      // _isActiveB = false;
                                                      // _isActiveC = false;
                                                      // _isActiveA = false;
                                                      // _isActiveE = false;
                                                      // _isActiveF = false;
                                                      dummy();
                                                    }
                                                    print("index=$index");
                                                    print("index1= $index1");
                                                  });
                                                },
                                                onDoubleTap: () {
                                                  setState(() {
                                                    index1 = index;

                                                    _isActiveD = !_isActiveD;
                                                    subject1[index] = 0;
                                                    score[index] = 1.0;
                                                    credit[index] = 0.0;
                                                    if (index1 == index) {
                                                      _isActiveD = !_isActiveD;
                                                    }

                                                    dummy();
                                                  });
                                                },
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: _isActiveD &&
                                                          subject1[index] > 0 &&
                                                          subject1[index] == 6
                                                      ? Colors.deepOrange
                                                      : Colors.white,
                                                  child: CircleAvatar(
                                                    radius: 19,
                                                    backgroundColor:
                                                        _isActiveD &&
                                                                subject1[
                                                                        index] >
                                                                    0 &&
                                                                subject1[
                                                                        index] ==
                                                                    6
                                                            ? Colors.white
                                                            : Colors.deepOrange,
                                                    child: Text(
                                                      "D",
                                                      style: TextStyle(
                                                          fontSize: 23,
                                                          color: _isActiveD &&
                                                                  subject1[
                                                                          index] >
                                                                      0 &&
                                                                  subject1[
                                                                          index] ==
                                                                      6
                                                              ? Colors
                                                                  .deepOrange
                                                              : Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    x = 2;
                                                    index1 = index;

                                                    _isActiveE = true;

                                                    if (index == index1) {
                                                      subject1[index] = 5;
                                                      credit[index] =
                                                          double.parse(snapshots
                                                                  .data
                                                                  .docs[index]
                                                              ['credit']);
                                                      score[index] =
                                                          (credit[index] *
                                                              subject1[index]);

                                                      // _isActiveS = false;
                                                      // _isActiveB = false;
                                                      // _isActiveC = false;
                                                      // _isActiveD = false;
                                                      // _isActiveA = false;
                                                      // _isActiveF = false;
                                                      dummy();
                                                    }
                                                    print("index=$index");
                                                    print("index1= $index1");
                                                  });
                                                },
                                                onDoubleTap: () {
                                                  setState(() {
                                                    index1 = index;

                                                    _isActiveE = !_isActiveE;
                                                    subject1[index] = 0;
                                                    score[index] = 1.0;
                                                    credit[index] = 0.0;
                                                    if (index1 == index) {
                                                      _isActiveE = !_isActiveE;
                                                    }

                                                    dummy();
                                                  });
                                                },
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: _isActiveE &&
                                                          subject1[index] > 0 &&
                                                          subject1[index] == 5
                                                      ? Colors.deepOrange
                                                      : Colors.white,
                                                  child: CircleAvatar(
                                                    radius: 19,
                                                    backgroundColor:
                                                        _isActiveE &&
                                                                subject1[
                                                                        index] >
                                                                    0 &&
                                                                subject1[
                                                                        index] ==
                                                                    5
                                                            ? Colors.white
                                                            : Colors.deepOrange,
                                                    child: Text(
                                                      "E",
                                                      style: TextStyle(
                                                          fontSize: 23,
                                                          color: _isActiveE &&
                                                                  subject1[
                                                                          index] >
                                                                      0 &&
                                                                  subject1[
                                                                          index] ==
                                                                      5
                                                              ? Colors
                                                                  .deepOrange
                                                              : Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    x = 2;
                                                    index1 = index;

                                                    _isActiveF = true;

                                                    if (index == index1) {
                                                      subject1[index] = 0;
                                                      credit[index] =
                                                          double.parse(snapshots
                                                                  .data
                                                                  .docs[index]
                                                              ['credit']);
                                                      score[index] =
                                                          (credit[index] *
                                                              subject1[index]);

                                                      // _isActiveS = false;
                                                      // _isActiveB = false;
                                                      // _isActiveC = false;
                                                      // _isActiveD = false;
                                                      // _isActiveE = false;
                                                      // _isActiveA = false;
                                                      dummy();
                                                    }
                                                    print("index=$index");
                                                    print("index1= $index1");
                                                  });
                                                },
                                                onDoubleTap: () {
                                                  setState(() {
                                                    index1 = index;

                                                    _isActiveF = !_isActiveF;
                                                    subject1[index] = 0;
                                                    score[index] = 1.0;
                                                    credit[index] = 0.0;
                                                    if (index1 == index) {
                                                      _isActiveF = !_isActiveF;
                                                    }

                                                    dummy();
                                                  });
                                                },
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: _isActiveF &&
                                                          subject1[index] == 0
                                                      ? Colors.deepOrange
                                                      : Colors.white,
                                                  child: CircleAvatar(
                                                    radius: 19,
                                                    backgroundColor:
                                                        _isActiveF &&
                                                                subject1[
                                                                        index] ==
                                                                    0
                                                            ? Colors.white
                                                            : Colors.deepOrange,
                                                    child: Text(
                                                      "F",
                                                      style: TextStyle(
                                                          fontSize: 23,
                                                          color: _isActiveF &&
                                                                  subject1[
                                                                          index] ==
                                                                      0
                                                              ? Colors
                                                                  .deepOrange
                                                              : Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    InkWell(
                      onTap: () {
                        if (widget.honor == false && widget.oe == false) {
                          credit.forEach((element) {
                            creditsum += element;
                          });
                          print(creditsum);
                          score.forEach((element) {
                            if (element == 1.0) {
                              print("null");
                            } else {
                              subsum = subsum + element;
                              subcount += 1;
                            }

                            cgpa = subsum / creditsum;
                          });
                          print("numerator  $subsum");
                          print("CGPA = $cgpa");
                        }
                        if (widget.honor == true && widget.oe == false) {}
                        if (widget.honor == false && widget.oe == true) {}
                      },
                      child: Container(
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
                      ),
                    )
                  ],
                ));
          },
        );
      },
    );
  }
}
