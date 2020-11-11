import 'package:flutter/cupertino.dart';
import 'assets.dart';
import 'consts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Tools {

  static Widget buildBar(String text, Color color) {
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
                borderRadius: BorderRadius.all(
                    Radius.circular(Consts.width(7))),
              ),
              width: Consts.width(32),
              height: Consts.width(3),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(Consts.width(7))),
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

  static Widget progressCircle(int value, int maxValue, String img, Color color){
    return Column(
      children: [
        new CircularPercentIndicator(
          radius: 60.0,
          lineWidth: 3.0,
          percent: value/maxValue,
          center: Image.asset(
            Assets.img(img),
            height: Consts.width(10),
            width: Consts.width(10),
          ),
          progressColor: color,
        ),
        Text(
          value.toString(),
          style: TextStyle(color: color),
        ),
      ],
    );
  }

}