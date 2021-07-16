import 'package:flutter/material.dart';
import 'package:ptu_cgpa_tracker/constants.dart';
import 'package:ptu_cgpa_tracker/screens/on_board.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatefulWidget {
  const Intro({Key key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  PageController pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: PageView(
            controller: pageController,
            children: [
              Slide(
                hero: Image.asset("assets/newwelcome.png"),
                title: "Welcome PTUians!",
                subtitle:
                    '"Department of Information Technology Proudly Presents "',
                onNext: nextPage,
                done: false,
                skip: () {
                  goToOnBoard(context);
                },
              ),
              Slide(
                hero: Image.asset("assets/intro1.png"),
                title: "PTU CGPA Tracker!",
                subtitle: '"Calculate your CGPA at ease"',
                onNext: nextPage,
                done: false,
                skip: () {
                  goToOnBoard(context);
                },
              ),
              Slide(
                hero: Image.asset("assets/intro2.png"),
                title: "View Your CGPA!",
                subtitle: '"Share with your homies"',
                onNext: nextPage,
                done: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }
}

class Slide extends StatelessWidget {
  final Widget hero;
  final String title;
  final String subtitle;
  final VoidCallback onNext;
  final bool done;
  final VoidCallback skip;

  Slide({
    this.hero,
    this.title,
    this.subtitle,
    this.onNext,
    this.done,
    this.skip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: hero,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: kTitleStyle,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  subtitle,
                  style: kSubtitleStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !done
                    ? GestureDetector(
                        onTap: skip,
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontFamily: "Raleway",
                            fontSize: 16,
                          ),
                        ),
                      )
                    : Container(),
                GestureDetector(
                  onTap: done
                      ? () {
                          goToOnBoard(context);
                        }
                      : onNext,
                  child: Text(
                    done ? "Done" : "Next",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: "Raleway",
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }
}

void goToOnBoard(BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool("showIntro", false).then((value) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OnBoard(),
      ),
    );
  });
}
