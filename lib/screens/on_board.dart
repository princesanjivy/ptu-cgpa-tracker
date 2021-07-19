import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ptu_cgpa_tracker/constants.dart';
import 'package:ptu_cgpa_tracker/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  final String dept;
  final String sem;
  final bool honor;
  final bool oe;

  Data(this.dept, this.sem, this.honor, this.oe);
}

class OnBoard extends StatefulWidget {
  final bool fromHome;
  OnBoard({Key key, this.fromHome}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  String chooseSem;
  String chooseDept;

  SharedPreferences prefs;

  BannerAd bannerAd;
  bool bannerAdLoaded = false;

  InterstitialAd interstitialAd;
  int maxFailedLoadAttempts = 3;
  int numInterstitialLoadAttempts = 0;

  @override
  void initState() {
    super.initState();

    _read();

    _createBannerAd();
    _createInterstitialAd();
  }

  _createBannerAd() {
    bannerAd = BannerAd(
      adUnitId: onBoardBannerId,
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

  _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: betweenInterstitialId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
          numInterstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (error) {
          numInterstitialLoadAttempts += 1;
          interstitialAd = null;
          if (numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (interstitialAd == null) {
      print("Ad not available");
      return;
    }
    interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        _createInterstitialAd();
      },
    );

    interstitialAd.show();
    // interstitialAd = null;
  }

  @override
  void dispose() {
    super.dispose();

    bannerAd.dispose();
    if (interstitialAd != null) interstitialAd.dispose();
  }

  _read() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      chooseDept = prefs.getString("chooseDept") ?? "IT";
      chooseSem = prefs.getString("chooseSem") ?? "3";
      honor = prefs.getBool("isHonor") ?? false;
      oe = prefs.getBool("isOe") ?? false;
    });
  }

  bool honor = false;
  bool oe = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: Text(
          'PTU CGPA TRACKER',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway',
            fontSize: size.height * 0.027,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            children: [
              SizedBox(
                height: 32,
              ),
              Hero(
                tag: "onBoard",
                child: Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: SvgPicture.asset(
                    "assets/onBoard.svg",
                    fit: BoxFit.contain,
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 55,
                  right: 55,
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 26, right: 26),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepOrange,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.black.withOpacity(.85),
                      elevation: 24,
                      hint: Text(
                        'Choose your Department',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * .02,
                            fontFamily: 'Raleway'),
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      iconSize: size.height * 0.04,
                      underline: SizedBox(),
                      isExpanded: true,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.height * .02,
                          fontFamily: 'Raleway'),
                      value: chooseDept,
                      items: _dropDownItem(),
                      onChanged: (value) {
                        setState(() {
                          chooseDept = value;
                        });
                        prefs.setString("chooseDept", chooseDept);
                        chooseDept = value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 55,
                  right: 55,
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 26, right: 26),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepOrange,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.black.withOpacity(.9),
                      elevation: 24,
                      hint: Text(
                        'Choose your semester',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: size.height * .02,
                            fontFamily: 'Raleway'),
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      iconSize: size.height * 0.04,
                      underline: SizedBox(),
                      isExpanded: true,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.height * .02,
                          fontFamily: 'Raleway'),
                      value: chooseSem,
                      items: _dropDownItemsem(),
                      onChanged: (value) {
                        setState(() {
                          chooseSem = value;
                        });

                        prefs.setString("chooseSem", chooseSem);
                        chooseSem = value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.deepOrange,
                            tristate: false,
                            value: honor,
                            onChanged: (bool value) {
                              setState(() {
                                honor = value;
                                print(honor);
                              });

                              prefs.setBool("isHonor", honor);
                            }),
                        Text("Honor/Minor",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.deepOrange,
                            value: oe,
                            onChanged: (bool value) {
                              setState(() {
                                oe = value;
                                print(oe);
                              });

                              prefs.setBool("isOe", oe);
                            }),
                        Text(
                          "Open Elective",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(32),
            child: InkWell(
              onTap: () {
                showInterstitialAd();

                if (widget.fromHome) {
                  Navigator.pop(context);
                } else {
                  prefs.setBool("showOnBoard", false).then((value) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Home(
                            // data: Data(chooseDept, chooseSem, honor, oe),
                            ),
                      ),
                    );
                  });
                }
              },
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      widget.fromHome ? "Change" : "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: size.height * 0.025,
                          fontFamily: 'Raleway',
                          letterSpacing: size.height * 0.002),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = [
      "ECE",
      "CSE",
      "IT",
      "MEC",
      "CHE",
      "EIE",
      "CIE",
      "EEE",
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _dropDownItemsem() {
    List<String> ddl1 = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
    ];
    return ddl1
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }
}
