import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'assets.dart';
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
        title: Text(
          Consts.getText(title),
          style: Consts.titleStyle,
        ),
      ),
      body: body,
    );
  }

  static Widget image({@required String img, double size = 10,
      bool blend = true}) {
    return blend ?
    ColorFiltered(
      colorFilter: ColorFilter.mode(Consts.textColor, BlendMode.srcIn),
      child: Image.asset(
        Assets.img(img),
        width: Consts.width(size),
        height: Consts.width(size),
      ),
    ) : Image.asset(
      Assets.img(img),
      width: Consts.width(size),
      height: Consts.width(size),
    );
  }

  static Widget imgRouteButton({@required Widget img,
      @required context, @required Widget route}) {
    return InkWell(child: img,
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => route)),
    );
  }

  static Widget popUp({@required String title, @required content, @required context}) {
    double padding = Consts.width(6);
    return AlertDialog(
      backgroundColor: Consts.mainColor,
      titlePadding: EdgeInsets.fromLTRB(padding, padding, padding, 0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: padding),
          Text(
            Consts.getText(title),
            style: Consts.titleStyle,
          ),
          InkWell(
            child: Icon(
              Icons.close,
              size: padding,
              color: Consts.textColor,
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
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

}