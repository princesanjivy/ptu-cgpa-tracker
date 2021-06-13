import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GradePage extends StatefulWidget {
  @override
  _GradePageState createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  int index1 = 0, c = 0;

  bool unSelect = false,
      _isActiveS = false,
      _isActiveA = false,
      _isActiveB = false,
      _isActiveC = false,
      _isActiveD = false,
      _isActiveE = false,
      _isActiveF = false;

  List<int> subject1 = [
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
  ];

  void dummy() {
    print("subject1=$subject1");
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("IT")
          .where("semester", isEqualTo: "7")
          .snapshots(),
      builder: (context, snapshots) {
        if (!snapshots.hasData)
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
          ));
        // if (snapshots.connectionState == ConnectionState.waiting) {
        //   return Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
        // String k = snapshots.data.docs[0].data()['course'];
        // if (snapshots.hasData) {
        //   print(k);
        // }

        return Scaffold(
          body: ListView.builder(
            shrinkWrap: true,
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
                                snapshots.data.docs[index]['course'],
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
                                      index1 = index;

                                      _isActiveS = true;

                                      if (index == index1) {
                                        subject1[index] = 10;

                                        // _isActiveA = false;
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

                                      _isActiveS = !_isActiveS;
                                      subject1[index] = 0;
                                      if (index1 == index) {
                                        _isActiveS = !_isActiveS;
                                      }

                                      dummy();
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: _isActiveS &&
                                            subject1[index] > 0 &&
                                            subject1[index] == 10
                                        ? Colors.deepOrange
                                        : Colors.white,
                                    child: CircleAvatar(
                                      radius: 19,
                                      backgroundColor: _isActiveS &&
                                              subject1[index] > 0 &&
                                              subject1[index] == 10
                                          ? Colors.white
                                          : Colors.deepOrange,
                                      child: Text(
                                        "S",
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: _isActiveS &&
                                                    subject1[index] > 0 &&
                                                    subject1[index] == 10
                                                ? Colors.deepOrange
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
                                      index1 = index;

                                      _isActiveA = true;

                                      if (index == index1) {
                                        subject1[index] = 9;

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
                                      backgroundColor: _isActiveA &&
                                              subject1[index] > 0 &&
                                              subject1[index] == 9
                                          ? Colors.white
                                          : Colors.deepOrange,
                                      child: Text(
                                        "A",
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: _isActiveA &&
                                                    subject1[index] > 0 &&
                                                    subject1[index] == 9
                                                ? Colors.deepOrange
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
                                      index1 = index;

                                      _isActiveB = true;

                                      if (index == index1) {
                                        subject1[index] = 8;

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
                                      backgroundColor: _isActiveB &&
                                              subject1[index] > 0 &&
                                              subject1[index] == 8
                                          ? Colors.white
                                          : Colors.deepOrange,
                                      child: Text(
                                        "B",
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: _isActiveB &&
                                                    subject1[index] > 0 &&
                                                    subject1[index] == 8
                                                ? Colors.deepOrange
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
                                      index1 = index;

                                      _isActiveC = true;

                                      if (index == index1) {
                                        subject1[index] = 7;

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
                                      backgroundColor: _isActiveC &&
                                              subject1[index] > 0 &&
                                              subject1[index] == 7
                                          ? Colors.white
                                          : Colors.deepOrange,
                                      child: Text(
                                        "C",
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: _isActiveC &&
                                                    subject1[index] > 0 &&
                                                    subject1[index] == 7
                                                ? Colors.deepOrange
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
                                      index1 = index;

                                      _isActiveD = true;

                                      if (index == index1) {
                                        subject1[index] = 6;

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
                                      backgroundColor: _isActiveD &&
                                              subject1[index] > 0 &&
                                              subject1[index] == 6
                                          ? Colors.white
                                          : Colors.deepOrange,
                                      child: Text(
                                        "D",
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: _isActiveD &&
                                                    subject1[index] > 0 &&
                                                    subject1[index] == 6
                                                ? Colors.deepOrange
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
                                      index1 = index;

                                      _isActiveE = true;

                                      if (index == index1) {
                                        subject1[index] = 5;

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
                                      backgroundColor: _isActiveE &&
                                              subject1[index] > 0 &&
                                              subject1[index] == 5
                                          ? Colors.white
                                          : Colors.deepOrange,
                                      child: Text(
                                        "E",
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: _isActiveE &&
                                                    subject1[index] > 0 &&
                                                    subject1[index] == 5
                                                ? Colors.deepOrange
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
                                      index1 = index;

                                      _isActiveF = true;

                                      if (index == index1) {
                                        subject1[index] = 0;

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
                                      if (index1 == index) {
                                        _isActiveF = !_isActiveF;
                                      }

                                      dummy();
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        _isActiveF && subject1[index] == 0
                                            ? Colors.deepOrange
                                            : Colors.white,
                                    child: CircleAvatar(
                                      radius: 19,
                                      backgroundColor:
                                          _isActiveF && subject1[index] == 0
                                              ? Colors.white
                                              : Colors.deepOrange,
                                      child: Text(
                                        "F",
                                        style: TextStyle(
                                          fontSize: 23,
                                          color:
                                              _isActiveF && subject1[index] == 0
                                                  ? Colors.deepOrange
                                                  : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
