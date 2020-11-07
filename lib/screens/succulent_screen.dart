import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/screens/guardian_screen.dart';
import 'package:pietrario_sample_app/util/assets.dart';
import 'package:pietrario_sample_app/util/consts.dart';
import 'package:pietrario_sample_app/util/prefabs.dart';

class SucculentScreen extends StatelessWidget {

  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Material(
      color: Consts.bgColor,
      child: Stack(
        children: [
          buildEnvironment(),
          Align(
            alignment: Alignment(-1.4, -0.6),
            child: Container(
              decoration: BoxDecoration(
                color: Consts.mainColor,
                shape: BoxShape.circle,
                border: Border.all(color: Consts.textColor),
              ),
              padding: EdgeInsets.all(Consts.width(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Mi Teyuna Parte 2',
                    textAlign: TextAlign.center,
                    style: Consts.textStyle,
                  ),
                  Prefabs.image(img: 'succulent1', size: 20, blend: false),
                ],
              ),
              width: Consts.width(50),
              height: Consts.width(50),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEnvironment() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                buildBar('health', Color(0xFF00CC66)),
                buildBar('hidratation', Color(0xFF0066CC)),
                buildBar('minerals', Color(0xFFAAAAAA)),
                buildBar('temperature', Color(0xFFCC3333)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  child: Image.asset(
                    Assets.img('fox'),
                    width: Consts.width(35),
                    height: Consts.width(50),
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GuardianScreen())),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBar(String text, Color color) {
    return Column(
      children: [
        SizedBox(height: Consts.width(3)),
        Text(
            Consts.getText(text),
            style: Consts.textStyle
        ),
        SizedBox(height: Consts.width(0.5)),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: color),
                borderRadius: BorderRadius.all(Radius.circular(Consts.width(7))),
              ),
              width: Consts.width(32),
              height: Consts.width(3),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(Consts.width(7))),
                color: color,
              ),
              width: 0.4 * Consts.width(32),
              height: Consts.width(3),
            ),
          ],
        )
      ],
    );
  }
}
