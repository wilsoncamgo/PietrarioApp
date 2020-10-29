import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/util/Assets.dart';
import 'package:pietrario_sample_app/util/Consts.dart';

class SucculentMenu extends StatelessWidget {
  const SucculentMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Image.asset(
                    Assets.img('succulent1'),
                    width: Consts.width(20),
                    height: Consts.width(20),
                  ),
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
            textAlign: TextAlign.start,
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
