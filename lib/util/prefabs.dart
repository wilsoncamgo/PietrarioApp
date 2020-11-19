import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'consts.dart';

class Prefabs {

  static Widget scaffold({@required String title, @required Widget body}) {
    return Scaffold(
      backgroundColor: Consts.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Consts.textColor, //change your color here
        ),
        centerTitle: true,
        title: Prefabs.title(title),
      ),
      body: body,
    );
  }

  static Widget text(String text, [bool search = true]) {
    return Text(
      search ? Consts.getText(text) : text,
      style: Consts.textStyle,
      textAlign: TextAlign.justify,
    );
  }

  static Widget title(String title) {
    return Text(
      Consts.getText(title),
      style: Consts.titleStyle,
    );
  }

  static Widget icon(IconData icon, {double size = 10}) {
    return Icon(
      icon,
      size: Consts.width(size),
      color: Consts.textColor,
    );
  }
  
  static Widget image({@required String img, double size = 10}) {
    return Image.asset(
      Assets.img(img),
      width: Consts.width(size),
      height: Consts.width(size),
    );
  }

  static Widget iconImg({@required String img, double size = 10, ColorFilter filter}) {
    filter = filter ?? ColorFilter.mode(Consts.textColor, BlendMode.srcIn);
    return ColorFiltered(
      colorFilter: filter,
      child: Prefabs.image(img: img, size: size),
    );
  }

  static Widget imgRouteBtn({@required String img, double size = 10,
      @required BuildContext ctx, @required Widget route}) {
    return InkWell(child: Prefabs.iconImg(img: img, size: size),
      onTap: () => Navigator.push(ctx,
          MaterialPageRoute(builder: (ctx) => route)),

    );
  }

  static Widget switchBtn({@required String text, bool value = true,
      @required void onChanged(v)}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Prefabs.text(text),
        Switch(
          value: value,
          activeTrackColor: Consts.btnScndColor,
          activeColor: Consts.btnMainColor,
          inactiveThumbColor: Consts.bgColor,
          inactiveTrackColor: Consts.scndColor,
          onChanged: (v) => onChanged(v),
        ),
      ],
    );
  }

  static Widget sliderBtn({@required String text, double min = 0,
    double max = 10, double value, int divisions = 10,
    @required void onChanged(v)}) {
    return Row(
      children: [
        Prefabs.text(text),
        Slider(
          value: value ?? max,
          min: min,
          max: max,
          divisions: divisions,
          activeColor: Consts.btnScndColor,
          inactiveColor: Consts.scndColor,
          onChanged: (v) => onChanged(v),
        ),
      ],
    );
  }

  static Widget popBtn({@required BuildContext ctx, double size = 6}) {
    return InkWell(
      child: Prefabs.iconImg(img: 'close', size: size),
      onTap: () => Navigator.of(ctx).pop(),
    );
  }

  static Widget popUp({@required String title, @required Widget content,
      @required BuildContext ctx}) {
    double padding = Consts.width(6);
    return AlertDialog(
      backgroundColor: Consts.mainColor,
      titlePadding: EdgeInsets.fromLTRB(padding, padding, padding, 0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: padding),
          Prefabs.title(title),
          Prefabs.popBtn(ctx: ctx),
        ],
      ),
      contentPadding: EdgeInsets.all(padding),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          content,
        ],
      ),
    );
  }

  static Widget circularPercentIndicator({@required double percent, Widget center,
      Color color, double lineWidth = 1, double radius = 12}) {
    return CircularPercentIndicator(
      animateFromLastPercent: true,
      animation: true,
      animationDuration: 200,
      backgroundColor: Consts.mainColor,
      lineWidth: Consts.width(lineWidth),
      percent: percent,
      progressColor: color ?? Consts.textColor,
      radius: Consts.width(radius),
      center: center,
    );
  }
}
