import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:ptu_cgpa_tracker/constants.dart';

class Result extends StatefulWidget {
  const Result(this.cgpa);

  final double cgpa;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  BannerAd bannerAd;
  bool bannerAdLoaded = false;

  @override
  void initState() {
    super.initState();

    _createBannerAd();
  }

  _createBannerAd() {
    bannerAd = BannerAd(
      adUnitId: homeBannerId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            bannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          bannerAd.dispose();
        },
      ),
    );

    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "CGPA",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway',
            fontSize: size.height * 0.027,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            if (widget.cgpa >= 0 && widget.cgpa <= 5)
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(children: [
                  Center(
                    child: Lottie.asset(
                      "assets/progress.json",
                      height: 300,
                      width: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text.rich(TextSpan(
                        text: 'CGPA : ',
                        style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0, .5),
                                blurRadius: 1.0,
                                color: Colors.white,
                              ),
                            ],
                            color: Colors.deepOrange,
                            fontSize: size.height * .050,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway'),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.cgpa.toStringAsFixed(2),
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 50,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ])),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Text(
                      "Every failure is a step to success. "
                      "Aim for more marks",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
            if (widget.cgpa > 5 && widget.cgpa <= 7)
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(children: [
                  Center(
                    child: Lottie.asset(
                      "assets/success.json",
                      height: 300,
                      width: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text.rich(TextSpan(
                        text: 'CGPA : ',
                        style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0, .5),
                                blurRadius: 1.0,
                                color: Colors.white,
                              ),
                            ],
                            color: Colors.deepOrange,
                            fontSize: size.height * .050,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway'),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.cgpa.toStringAsFixed(2),
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 50,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ])),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(
                      "Be consistent on your learning ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
            if (widget.cgpa > 7 && widget.cgpa <= 9)
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(children: [
                  Center(
                    child: Lottie.asset(
                      "assets/happystar.json",
                      height: 300,
                      width: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: Text.rich(TextSpan(
                        text: 'CGPA : ',
                        style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0, .5),
                                blurRadius: 1.0,
                                color: Colors.white,
                              ),
                            ],
                            color: Colors.deepOrange,
                            fontSize: size.height * .050,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway'),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.cgpa.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ])),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Text(
                      "Congraluations!                           "
                      "You are at the one step behind the success",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
            if (widget.cgpa > 9 && widget.cgpa <= 10)
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(children: [
                  Center(
                    child: Lottie.asset(
                      "assets/trophy.json",
                      height: 300,
                      width: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text.rich(TextSpan(
                        text: 'CGPA : ',
                        style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0, .5),
                                blurRadius: 1.0,
                                color: Colors.white,
                              ),
                            ],
                            color: Colors.deepOrange,
                            fontSize: size.height * .050,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway'),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.cgpa.toStringAsFixed(2),
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 50,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ])),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Text(
                      "Sawadekha! Happy now?                           "
                      "Hard work never fails",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
            SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: () {
                print(widget.cgpa);
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                    child: Text(
                  "Go to home",
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: bannerAdLoaded
          ? Container(
              width: bannerAd.size.width.toDouble(),
              height: bannerAd.size.height.toDouble(),
              child: AdWidget(
                ad: bannerAd,
              ),
            )
          : null,
    );
  }
}
