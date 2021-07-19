import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ptu_cgpa_tracker/screens/result.dart';

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
  }

  double finalhonour = 0.0;

  double finaloe = 0.0;

  double openelective = 1.0;

  double honor = 1.0;

  double creditsum = 0.0;

  double cgpa = 0;

  double cgpa1 = 0;

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

  List<double> credit = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: Text(
          'CALCULATE CGPA',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway',
            fontSize: size.height * 0.027,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(widget.dept)
            .where("semester", isEqualTo: widget.sem)
            .snapshots(),
        builder: (context, snapshots) {
          if (x == 1 && snapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Colors.deepOrange),
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                //LISTVIEW BUILDEER WITHOUT HONOUR AND OPEN ELECTIVE
                ListView.builder(
                    itemCount: snapshots.data.docs.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      print(snapshots.data.docs.length);
                      snapshots.data.docs.forEach((element) {
                        if (credit.length < snapshots.data.docs.length)
                          credit.add(0.0);
                      });
                      return Padding(
                        padding: EdgeInsets.all(size.height * .01),
                        child: Container(
                          padding: EdgeInsets.all(size.height * .0005),
                          height: snapshots.data.docs[index]['course']
                                      .toString()
                                      .length >
                                  39
                              ? size.height * .15
                              : size.height * .125,
                          width: size.width * .9,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(size.height * .02),
                              gradient: LinearGradient(
                                  colors: [Colors.black, Colors.white],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(size.height * .02),
                                color: Colors.black),
                            child: Padding(
                              padding: EdgeInsets.all(size.width * .03),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        snapshots.data.docs[index]['course'],
                                        style: TextStyle(
                                          fontSize: size.height * .021,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.width * .04,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: size.width * .015,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              x = 2;
                                              index1 = index;

                                              _isActiveS = true;

                                              if (index == index1) {
                                                subject1[index] = 10.0;
                                                credit[index] = double.parse(
                                                    snapshots.data.docs[index]
                                                        ['credit']);
                                                score[index] = (credit[index] *
                                                    subject1[index]);
                                              }
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
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: size.height * .026,
                                            backgroundColor: _isActiveS &&
                                                    subject1[index] > 0.0 &&
                                                    subject1[index] == 10.0
                                                ? Colors.deepOrange
                                                : Colors.white,
                                            child: CircleAvatar(
                                              radius: size.height * .024,
                                              backgroundColor: _isActiveS &&
                                                      subject1[index] > 0.0 &&
                                                      subject1[index] == 10.0
                                                  ? Colors.white
                                                  : Colors.deepOrange,
                                              child: Text(
                                                "S",
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * .027,
                                                    color: _isActiveS &&
                                                            subject1[index] >
                                                                0.0 &&
                                                            subject1[index] ==
                                                                10.0
                                                        ? Colors.deepOrange
                                                        : Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * .015,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              x = 2;
                                              index1 = index;

                                              _isActiveA = true;

                                              if (index == index1) {
                                                subject1[index] = 9;
                                                credit[index] = double.parse(
                                                    snapshots.data.docs[index]
                                                        ['credit']);
                                                score[index] = (credit[index] *
                                                    subject1[index]);
                                              }
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
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: size.height * .026,
                                            backgroundColor: _isActiveA &&
                                                    subject1[index] > 0 &&
                                                    subject1[index] == 9
                                                ? Colors.deepOrange
                                                : Colors.white,
                                            child: CircleAvatar(
                                              radius: size.height * .024,
                                              backgroundColor: _isActiveA &&
                                                      subject1[index] > 0 &&
                                                      subject1[index] == 9
                                                  ? Colors.white
                                                  : Colors.deepOrange,
                                              child: Text(
                                                "A",
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * .027,
                                                    color: _isActiveA &&
                                                            subject1[index] >
                                                                0 &&
                                                            subject1[index] == 9
                                                        ? Colors.deepOrange
                                                        : Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * .015,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              x = 2;
                                              index1 = index;

                                              _isActiveB = true;

                                              if (index == index1) {
                                                subject1[index] = 8;
                                                credit[index] = double.parse(
                                                    snapshots.data.docs[index]
                                                        ['credit']);
                                                score[index] = (credit[index] *
                                                    subject1[index]);
                                              }
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
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: size.height * .026,
                                            backgroundColor: _isActiveB &&
                                                    subject1[index] > 0 &&
                                                    subject1[index] == 8
                                                ? Colors.deepOrange
                                                : Colors.white,
                                            child: CircleAvatar(
                                              radius: size.height * .024,
                                              backgroundColor: _isActiveB &&
                                                      subject1[index] > 0 &&
                                                      subject1[index] == 8
                                                  ? Colors.white
                                                  : Colors.deepOrange,
                                              child: Text(
                                                "B",
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * .027,
                                                    color: _isActiveB &&
                                                            subject1[index] >
                                                                0 &&
                                                            subject1[index] == 8
                                                        ? Colors.deepOrange
                                                        : Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * .015,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              x = 2;
                                              index1 = index;

                                              _isActiveC = true;

                                              if (index == index1) {
                                                subject1[index] = 7;
                                                credit[index] = double.parse(
                                                    snapshots.data.docs[index]
                                                        ['credit']);
                                                score[index] = (credit[index] *
                                                    subject1[index]);
                                              }
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
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: size.height * .026,
                                            backgroundColor: _isActiveC &&
                                                    subject1[index] > 0 &&
                                                    subject1[index] == 7
                                                ? Colors.deepOrange
                                                : Colors.white,
                                            child: CircleAvatar(
                                              radius: size.height * .024,
                                              backgroundColor: _isActiveC &&
                                                      subject1[index] > 0 &&
                                                      subject1[index] == 7
                                                  ? Colors.white
                                                  : Colors.deepOrange,
                                              child: Text(
                                                "C",
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * .027,
                                                    color: _isActiveC &&
                                                            subject1[index] >
                                                                0 &&
                                                            subject1[index] == 7
                                                        ? Colors.deepOrange
                                                        : Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * .015,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              x = 2;
                                              index1 = index;

                                              _isActiveD = true;

                                              if (index == index1) {
                                                subject1[index] = 6;
                                                credit[index] = double.parse(
                                                    snapshots.data.docs[index]
                                                        ['credit']);
                                                score[index] = (credit[index] *
                                                    subject1[index]);
                                              }
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
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: size.height * .026,
                                            backgroundColor: _isActiveD &&
                                                    subject1[index] > 0 &&
                                                    subject1[index] == 6
                                                ? Colors.deepOrange
                                                : Colors.white,
                                            child: CircleAvatar(
                                              radius: size.height * .024,
                                              backgroundColor: _isActiveD &&
                                                      subject1[index] > 0 &&
                                                      subject1[index] == 6
                                                  ? Colors.white
                                                  : Colors.deepOrange,
                                              child: Text(
                                                "D",
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * .027,
                                                    color: _isActiveD &&
                                                            subject1[index] >
                                                                0 &&
                                                            subject1[index] == 6
                                                        ? Colors.deepOrange
                                                        : Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * .015,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              x = 2;
                                              index1 = index;

                                              _isActiveE = true;

                                              if (index == index1) {
                                                subject1[index] = 5;
                                                credit[index] = double.parse(
                                                    snapshots.data.docs[index]
                                                        ['credit']);
                                                score[index] = (credit[index] *
                                                    subject1[index]);
                                              }
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
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: size.height * .026,
                                            backgroundColor: _isActiveE &&
                                                    subject1[index] > 0 &&
                                                    subject1[index] == 5
                                                ? Colors.deepOrange
                                                : Colors.white,
                                            child: CircleAvatar(
                                              radius: size.height * .024,
                                              backgroundColor: _isActiveE &&
                                                      subject1[index] > 0 &&
                                                      subject1[index] == 5
                                                  ? Colors.white
                                                  : Colors.deepOrange,
                                              child: Text(
                                                "E",
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * .027,
                                                    color: _isActiveE &&
                                                            subject1[index] >
                                                                0 &&
                                                            subject1[index] == 5
                                                        ? Colors.deepOrange
                                                        : Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * .015,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              x = 2;
                                              index1 = index;

                                              _isActiveF = true;

                                              if (index == index1) {
                                                subject1[index] = 0;
                                                credit[index] = double.parse(
                                                    snapshots.data.docs[index]
                                                        ['credit']);
                                                score[index] = (credit[index] *
                                                    subject1[index]);
                                              }
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
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: size.height * .026,
                                            backgroundColor: _isActiveF &&
                                                    subject1[index] == 0
                                                ? Colors.deepOrange
                                                : Colors.white,
                                            child: CircleAvatar(
                                              radius: size.height * .024,
                                              backgroundColor: _isActiveF &&
                                                      subject1[index] == 0
                                                  ? Colors.white
                                                  : Colors.deepOrange,
                                              child: Text(
                                                "F",
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * .027,
                                                    color: _isActiveF &&
                                                            subject1[index] == 0
                                                        ? Colors.deepOrange
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
                //HONOR
                if (widget.honor == true)
                  Padding(
                    padding: EdgeInsets.all(size.height * .01),
                    child: Container(
                      padding: EdgeInsets.all(size.height * .0005),
                      height: size.height * .125,
                      width: size.height * .9,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.height * .02),
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.white],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.height * .02),
                            color: Colors.black),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * .03),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Honour/Minor',
                                    style: TextStyle(
                                      fontSize: size.height * .021,
                                      color: Colors.white,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.width * .04,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * .01,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveS = true;
                                          honor = 10.0;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveS = !_isActiveS;
                                          honor = 1.0;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor: _isActiveS &&
                                                honor > 0 &&
                                                honor == 10
                                            ? Colors.deepOrange
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor: _isActiveS &&
                                                  honor > 0 &&
                                                  honor == 10
                                              ? Colors.white
                                              : Colors.deepOrange,
                                          child: Text(
                                            "S",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveS &&
                                                        honor > 0 &&
                                                        honor == 10
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
                                          x = 2;
                                          _isActiveA = true;
                                          honor = 9.0;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveA = !_isActiveA;
                                          honor = 1.0;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor: _isActiveA &&
                                                honor > 0 &&
                                                honor == 9
                                            ? Colors.deepOrange
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor: _isActiveA &&
                                                  honor > 0 &&
                                                  honor == 9
                                              ? Colors.white
                                              : Colors.deepOrange,
                                          child: Text(
                                            "A",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveA &&
                                                        honor > 0 &&
                                                        honor == 9
                                                    ? Colors.deepOrange
                                                    : Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveB = true;
                                          honor = 8.0;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveB = !_isActiveB;
                                          honor = 1.0;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor: _isActiveB &&
                                                honor > 0 &&
                                                honor == 8
                                            ? Colors.deepOrange
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor: _isActiveB &&
                                                  honor > 0 &&
                                                  honor == 8
                                              ? Colors.white
                                              : Colors.deepOrange,
                                          child: Text(
                                            "B",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveB &&
                                                        honor > 0 &&
                                                        honor == 8
                                                    ? Colors.deepOrange
                                                    : Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveC = true;
                                          honor = 7.0;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveC = !_isActiveC;
                                          honor = 1.0;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor: _isActiveC &&
                                                honor > 0 &&
                                                honor == 7
                                            ? Colors.deepOrange
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor: _isActiveC &&
                                                  honor > 0 &&
                                                  honor == 7
                                              ? Colors.white
                                              : Colors.deepOrange,
                                          child: Text(
                                            "C",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveC &&
                                                        honor > 0 &&
                                                        honor == 7
                                                    ? Colors.deepOrange
                                                    : Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveD = true;
                                          honor = 6.0;
                                          print(honor);
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveD = !_isActiveD;
                                          honor = 1.0;
                                          print(honor);
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor: _isActiveD &&
                                                honor > 0 &&
                                                honor == 6
                                            ? Colors.deepOrange
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor: _isActiveD &&
                                                  honor > 0 &&
                                                  honor == 6
                                              ? Colors.white
                                              : Colors.deepOrange,
                                          child: Text(
                                            "D",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveD &&
                                                        honor > 0 &&
                                                        honor == 6
                                                    ? Colors.deepOrange
                                                    : Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveE = true;
                                          honor = 5.0;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveE = !_isActiveE;
                                          honor = 1.0;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor: _isActiveE &&
                                                honor > 0 &&
                                                honor == 5
                                            ? Colors.deepOrange
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor: _isActiveE &&
                                                  honor > 0 &&
                                                  honor == 5
                                              ? Colors.white
                                              : Colors.deepOrange,
                                          child: Text(
                                            "E",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveE &&
                                                        honor > 0 &&
                                                        honor == 5
                                                    ? Colors.deepOrange
                                                    : Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveF = true;
                                          honor = 0.0;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveF = !_isActiveF;
                                          honor = 1.0;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor:
                                            _isActiveF && honor == 0
                                                ? Colors.deepOrange
                                                : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor:
                                              _isActiveF && honor == 0
                                                  ? Colors.white
                                                  : Colors.deepOrange,
                                          child: Text(
                                            "F",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveF && honor == 0
                                                    ? Colors.deepOrange
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
                  ),
                //Open Elective

                if (widget.oe == true)
                  Padding(
                    padding: EdgeInsets.all(size.height * .01),
                    child: Container(
                      padding: EdgeInsets.all(size.height * .0005),
                      height: size.height * .125,
                      width: size.height * .9,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.height * .02),
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.white],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.height * .02),
                            color: Colors.black),
                        child: Padding(
                          padding: EdgeInsets.all(size.height * .01),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Open Elective',
                                    style: TextStyle(
                                      fontSize: size.height * .021,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveS = true;
                                          openelective = 10.0;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveS = !_isActiveS;
                                          openelective = 1.0;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor: _isActiveS &&
                                                openelective > 0 &&
                                                openelective == 10
                                            ? Colors.deepOrange
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor: _isActiveS &&
                                                  openelective > 0 &&
                                                  openelective == 10
                                              ? Colors.white
                                              : Colors.deepOrange,
                                          child: Text(
                                            "S",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveS &&
                                                        openelective > 0 &&
                                                        openelective == 10
                                                    ? Colors.deepOrange
                                                    : Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveA = true;
                                          openelective = 9.0;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveA = !_isActiveA;
                                          openelective = 1.0;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor: _isActiveA &&
                                                openelective > 0 &&
                                                openelective == 9
                                            ? Colors.deepOrange
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor: _isActiveA &&
                                                  openelective > 0 &&
                                                  openelective == 9
                                              ? Colors.white
                                              : Colors.deepOrange,
                                          child: Text(
                                            "A",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveA &&
                                                        openelective > 0 &&
                                                        openelective == 9
                                                    ? Colors.deepOrange
                                                    : Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveB = true;
                                          openelective = 8.0;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveB = !_isActiveB;
                                          openelective = 1.0;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor: _isActiveB &&
                                                openelective > 0 &&
                                                openelective == 8
                                            ? Colors.deepOrange
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor: _isActiveB &&
                                                  openelective > 0 &&
                                                  openelective == 8
                                              ? Colors.white
                                              : Colors.deepOrange,
                                          child: Text(
                                            "B",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveB &&
                                                        openelective > 0 &&
                                                        openelective == 8
                                                    ? Colors.deepOrange
                                                    : Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveC = true;
                                          openelective = 7.0;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveC = !_isActiveC;
                                          openelective = 1.0;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor: _isActiveC &&
                                                openelective > 0 &&
                                                openelective == 7
                                            ? Colors.deepOrange
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor: _isActiveC &&
                                                  openelective > 0 &&
                                                  openelective == 7
                                              ? Colors.white
                                              : Colors.deepOrange,
                                          child: Text(
                                            "C",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveC &&
                                                        openelective > 0 &&
                                                        openelective == 7
                                                    ? Colors.deepOrange
                                                    : Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveD = true;
                                          openelective = 6.0;
                                          print(honor);
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveD = !_isActiveD;
                                          openelective = 1.0;
                                          print(openelective);
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor: _isActiveD &&
                                                openelective > 0 &&
                                                openelective == 6
                                            ? Colors.deepOrange
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor: _isActiveD &&
                                                  openelective > 0 &&
                                                  openelective == 6
                                              ? Colors.white
                                              : Colors.deepOrange,
                                          child: Text(
                                            "D",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveD &&
                                                        openelective > 0 &&
                                                        openelective == 6
                                                    ? Colors.deepOrange
                                                    : Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveE = true;
                                          openelective = 5.0;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveE = !_isActiveE;
                                          openelective = 1.0;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor: _isActiveE &&
                                                openelective > 0 &&
                                                openelective == 5
                                            ? Colors.deepOrange
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor: _isActiveE &&
                                                  openelective > 0 &&
                                                  openelective == 5
                                              ? Colors.white
                                              : Colors.deepOrange,
                                          child: Text(
                                            "E",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveE &&
                                                        openelective > 0 &&
                                                        openelective == 5
                                                    ? Colors.deepOrange
                                                    : Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          x = 2;
                                          _isActiveF = true;
                                          openelective = 0.0;
                                        });
                                      },
                                      onDoubleTap: () {
                                        setState(() {
                                          _isActiveF = !_isActiveF;
                                          openelective = 1.0;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: size.height * .026,
                                        backgroundColor:
                                            _isActiveF && openelective == 0
                                                ? Colors.deepOrange
                                                : Colors.white,
                                        child: CircleAvatar(
                                          radius: size.height * .024,
                                          backgroundColor:
                                              _isActiveF && openelective == 0
                                                  ? Colors.white
                                                  : Colors.deepOrange,
                                          child: Text(
                                            "F",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: _isActiveF &&
                                                        openelective == 0
                                                    ? Colors.deepOrange
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
                  ),

                //CALCULATE BUTTON
                InkWell(
                  onTap: () {
                    print(credit);
                    if (!credit.contains(0.0)) {
                      if (widget.honor == false && widget.oe == false) {
                        credit.forEach((element) {
                          creditsum += element;
                        });

                        score.forEach((element) {
                          if (element == 1.0) {
                            print("null");
                          } else {
                            subsum = subsum + element;
                            subcount += 1;
                          }
                        });
                        setState(() {
                          cgpa = subsum / creditsum;
                          subsum = 0.0;
                          creditsum = 0.0;
                        });
                      }
                      if (widget.honor == true && widget.oe == false) {
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
                        });
                        finalhonour = honor * 4;
                        subsum = subsum + finalhonour;
                        subcount = subcount + 1;
                        creditsum = creditsum + 4;
                        setState(() {
                          cgpa = subsum / creditsum;
                          subsum = 0.0;
                          creditsum = 0.0;
                        });
                      }
                      if (widget.honor == false && widget.oe == true) {
                        credit.forEach((element) {
                          creditsum += element;
                        });

                        score.forEach((element) {
                          if (element == 1.0) {
                            print("null");
                          } else {
                            subsum = subsum + element;
                            subcount += 1;
                          }
                        });
                        finaloe = openelective * 3;
                        subsum = subsum + finaloe;
                        subcount = subcount + 1;
                        creditsum = creditsum + 3;
                        setState(() {
                          cgpa = subsum / creditsum;
                          subsum = 0.0;
                          creditsum = 0.0;
                        });
                      }
                      if (widget.honor == true && widget.oe == true) {
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
                        });
                        print("subsum at start  $subsum");
                        finalhonour = honor * 4;
                        subsum = subsum + finalhonour;
                        subcount = subcount + 1;
                        creditsum = creditsum + 4;
                        finaloe = openelective * 3;
                        subsum = subsum + finaloe;
                        subcount = subcount + 1;
                        creditsum = creditsum + 3;
                        setState(() {
                          cgpa = subsum / creditsum;

                          subsum = 0.0;
                          creditsum = 0.0;
                        });
                      }

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Result(cgpa),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          behavior: SnackBarBehavior.floating,
                          content: ListTile(
                            leading: Icon(
                              Icons.warning_rounded,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Please select all",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Container(
                      child: Center(
                          child: Text(
                        "Calculate",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: size.height * 0.025,
                            fontFamily: 'Raleway',
                            letterSpacing: size.height * 0.002),
                      )),
                      width: size.width * 0.4,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepOrange),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
