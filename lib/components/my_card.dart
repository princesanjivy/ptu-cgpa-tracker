import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCustomCard extends StatelessWidget {
  final Function onTap;
  final String illustrationPath, title, tag;

  MyCustomCard({
    this.onTap,
    this.illustrationPath,
    this.title,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        color: Colors.white12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: tag,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SvgPicture.asset(
                  illustrationPath,
                  fit: BoxFit.contain,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
