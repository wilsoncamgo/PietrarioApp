import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/util/assets.dart';
import 'package:pietrario_sample_app/util/consts.dart';
import 'package:pietrario_sample_app/util/prefabs.dart';

class GuardianScreen extends StatefulWidget {
  const GuardianScreen({Key key}) : super(key: key);

  @override
  _GuardianScreenState createState() => _GuardianScreenState();
}

class _GuardianScreenState extends State<GuardianScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-1, 0.4),
            child: Row(
              children: [
                Image.asset(
                  Assets.img('dog'),
                  width: Consts.width(40),
                  height: Consts.width(100),
                ),
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: Consts.width(6),
                    color: Consts.textColor,
                  ),
                ),
                SizedBox(width: Consts.width(8)),
                InkWell(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: Consts.width(6),
                    color: Consts.textColor,
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
              width: Consts.width(30),
              height: Consts.width(30),
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
              width: Consts.width(30),
              height: Consts.width(30),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context) {
    return Prefabs.popUp(
      title: 'market',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              'Este pastor aleman, habitante de los climas fríos es idóneo para proteger de depredadores a sus amos y sus posesiones.',
              style: Consts.textStyle,
          )
        ],
      ),
      context: context,
    );
  }

  Widget buildMainCircle() {
    return Align(
      alignment: Alignment(-1, 0.4),
      child: Image.asset(
        Assets.img('Ellipse-2'),
        width: Consts.width(90),
        height: Consts.height(90),
      ),
    );
  }

  Widget buildEnvironment() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Consts.width(6)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: Consts.width(7.2),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Guardián Canino',
                    style: Consts.textStyle,
                  ),
                ),
                SizedBox(
                  height: Consts.width(7.2),
                  width: Consts.width(7.2),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildAboutDialog(context),
                ),
                child: Icon(
                  Icons.info,
                  size: Consts.width(8),
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
