import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pietrario_sample_app/screens/market.dart';
import 'package:pietrario_sample_app/screens/settings.dart';
import 'package:pietrario_sample_app/screens/timer/time_selection.dart';
import 'package:pietrario_sample_app/util/Assets.dart';
import 'package:pietrario_sample_app/util/Consts.dart';

/// @author wilsoncamgo
class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
      Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          buildDashboard(),
          buildLatMenu(),
          buildTop()
        ],
      ),
    );
  }

  Widget buildLatMenu() {
    double btnSize = Consts.width(10);
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Align(
          alignment: Alignment(1.2, 0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(Consts.width(7)),
              ),
              color: Consts.mainColor,
            ),
            padding: EdgeInsets.symmetric(
              vertical: Consts.width(7),
              horizontal: Consts.width(4),
            ),
            width: Consts.width(25),
            height: Consts.height(60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Image.asset(
                    Assets.img('time'),
                    width: btnSize,
                    height: btnSize,
                  ),
                  onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TimeSelection()),
                  ),
                ),
                InkWell(
                  child: Image.asset(
                    Assets.img('market'),
                    width: btnSize,
                    height: btnSize,
                  ),
                  onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Market()),
                  ),
                ),
                InkWell(
                  child: Image.asset(
                    Assets.img('coin'),
                    width: btnSize,
                    height: btnSize,
                  ),
                ),
                InkWell(
                  child: Image.asset(
                    Assets.img('question'),
                    width: btnSize,
                    height: btnSize,
                  ),
                ),
                InkWell(
                  child: Image.asset(
                    Assets.img('settings'),
                    width: btnSize,
                    height: btnSize,
                  ),
                  onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDashboard() {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : - Consts.width(60),
      right: isCollapsed ? 0 : Consts.width(40),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: SafeArea(
          left: false,
          child: Stack(
            children: [
              Align(
                alignment: Alignment(-1.5, -0.6),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Consts.width(5)),
                    ),
                    color: Consts.mainColor,
                  ),
                  padding: EdgeInsets.all(Consts.width(5)),
                  width: Consts.width(45),
                  height: Consts.width(45),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            Assets.img('water'),
                            width: Consts.width(7),
                            height: Consts.width(7),
                          ),
                          SizedBox(
                            width: Consts.width(3),
                          ),
                          AutoSizeText(
                            "30%",
                            style: Consts.textStyle,
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image(
                            image: AssetImage(Assets.img('moss')),
                            width: Consts.width(7),
                            height: Consts.width(7),
                          ),
                          SizedBox(
                            width: Consts.width(3),
                          ),
                          AutoSizeText(
                            "40%",
                            style: Consts.textStyle,
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            Assets.img('lightning'),
                            width: Consts.width(7),
                            height: Consts.width(7),
                          ),
                          SizedBox(
                            width: Consts.width(3),
                          ),
                          AutoSizeText(
                            "80%",
                            style: Consts.textStyle,
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.8, -0.6),
                child: CircularPercentIndicator(
                  animationDuration: 100,
                  animateFromLastPercent: true,
                  arcType: ArcType.FULL,
                  backgroundColor: Consts.bgColor,
                  progressColor: Colors.yellow,
                  percent: 0.5,
                  animation: true,
                  radius: Consts.width(22),
                  lineWidth: Consts.width(1),
                  center: AutoSizeText(
                    "50%",
                    style: Consts.textStyle,
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(
                  bottom: Consts.width(20),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Consts.width(5),
                ),
                child: InkWell(
                  child: Image.asset(
                    Assets.img('mountain2'),
                    width: Consts.width(80),
                    height: Consts.width(80),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTop() {
    return AnimatedPositioned(
      duration: duration,
      //bottom: isCollapsed ? 0 : 0.2 * screenWidth,
      //right: isCollapsed ? 0 : 0.6 * screenWidth,
      left: isCollapsed ? 0 : - 40,
      width: Consts.width(100),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Consts.width(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Icon(
                  Icons.exit_to_app_sharp,
                  size: Consts.width(9),
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.menu,
                  size: Consts.width(9),
                ),
                onTap: () => setState(() {
                  if (isCollapsed) _controller.forward();
                  else _controller.reverse();
                  isCollapsed = !isCollapsed;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}