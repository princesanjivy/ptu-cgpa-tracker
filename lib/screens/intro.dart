import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptu_cgpa_tracker/constants.dart';
import 'package:ptu_cgpa_tracker/screens/on_board.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatefulWidget {
  final bool viewIntro;
  const Intro({required this.viewIntro});

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
                viewIntro: widget.viewIntro,
                hero: Hero(
                  tag: "appIntro",
                  child: SvgPicture.asset(
                    "assets/intro1.svg",
                    fit: BoxFit.contain,
                    height: 200,
                    width: 200,
                  ),
                ),
                title: "Welcome PTUians!",
                subtitle:
                    '"Department of Information Technology Proudly Presents "',
                onNext: nextPage,
                done: false,
                skip: () {
                  if (widget.viewIntro ?? false)
                    Navigator.pop(context);
                  else
                    goToOnBoard(context);
                },
              ),
              Slide(
                viewIntro: widget.viewIntro,
                hero: SvgPicture.asset(
                  "assets/intro2.svg",
                  fit: BoxFit.contain,
                  height: 200,
                  width: 200,
                ),
                title: "PTU CGPA Tracker!",
                subtitle: '"Calculate your CGPA at ease"',
                onNext: nextPage,
                done: false,
                skip: () {
                  if (widget.viewIntro ?? false)
                    Navigator.pop(context);
                  else
                    goToOnBoard(context);
                },
              ),
              Slide(
                viewIntro: widget.viewIntro,
                hero: SvgPicture.asset(
                  "assets/intro3.svg",
                  fit: BoxFit.contain,
                  height: 200,
                  width: 200,
                ),
                title: "View Your CGPA!",
                subtitle: '"Share with your homies"',
                onNext: nextPage,
                done: true, skip: () {  },
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
  final bool viewIntro;
  final Widget hero;
  final String title;
  final String subtitle;
  final VoidCallback onNext;
  final bool done;
  final VoidCallback skip;

  Slide({
    required this.hero,
    required this.title,
    required this.subtitle,
    required this.onNext,
    required this.done,
    required this.skip,
    required this.viewIntro,
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
                          if (viewIntro ?? false)
                            Navigator.pop(context);
                          else
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
        builder: (context) => OnBoard(
          fromHome: false,
        ),
      ),
    );
  });
}
