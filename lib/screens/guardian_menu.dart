import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class GuardianMenu extends StatelessWidget {
  const GuardianMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-1, 0.4),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/dog_lowpoly.png'),
                  width: 200,
                  height: 500,
                ),
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                InkWell(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          buildEnvironment(),
          buildMainCircle(),
          Align(
            alignment: Alignment(-0.5, 0.9),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.red,
                ),
              ),
              width: 150,
              height: 150,
            ),
          ),
          Align(
            alignment: Alignment(0.4, -0.5),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              width: 150,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMainCircle() {
    return Align(
      alignment: Alignment(-1, 0.4),
      child: Image(
        image: AssetImage('assets/Ellipse-2.png'),
      ),
    );
  }

  Widget buildEnvironment() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 36,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    "Guardián Canino",
                    textAlign: TextAlign.center,
                    maxFontSize: 20,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  height: 36,
                  width: 36,
                )
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Icon(
                  Icons.info,
                  size: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.moveTo(size.width - size.width / 2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - size.width / 2, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
