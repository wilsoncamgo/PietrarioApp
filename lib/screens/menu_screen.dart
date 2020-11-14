import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pietrario_sample_app/model/Resource.dart';
import 'package:pietrario_sample_app/model/User.dart';
import 'package:pietrario_sample_app/screens/inventory_screen.dart';
import 'package:pietrario_sample_app/screens/market_screen.dart';
import 'package:pietrario_sample_app/screens/pietrario_screen.dart';
import 'package:pietrario_sample_app/screens/settings_screen.dart';
import 'package:pietrario_sample_app/screens/timer_screen.dart';
import 'package:pietrario_sample_app/util/consts.dart';
import 'package:pietrario_sample_app/util/prefabs.dart';

import 'help_screen.dart';

/// @author wilsoncamgo
class MenuScreen extends StatefulWidget {
  MenuScreen({Key key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
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
      color: Consts.bgColor,
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
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Align(
          alignment: Alignment(1, 0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Consts.width(7)),
                bottomLeft: Radius.circular(Consts.width(7)),
              ),
              color: Consts.mainColor,
            ),
            width: Consts.width(20),
            height: Consts.width(100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <String, Widget>{
                'time' : TimerScreen(),
                'market' : MarketScreen(),
                'inventory' : InventoryScreen(),
                'help' : HelpScreen(),
                'settings' : SettingsScreen(),
              }.entries.map((e) => Prefabs.imgRouteButton(
                  img: Prefabs.image(img: e.key), context: context, route: e.value)).toList(),
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
      left: isCollapsed ? 0 : - Consts.width(50),
      right: isCollapsed ? 0 : Consts.width(10),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: SafeArea(
          left: false,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: Consts.width(20)),
                child: Prefabs.imgRouteButton(img:
                Prefabs.image(img: 'pietrario', size: 90, blend: false),
                    context: context, route: PietrarioScreen()),
              ),
              Align(
                alignment: Alignment(-1, -0.6),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Consts.width(5)),
                      bottomRight: Radius.circular(Consts.width(5)),
                    ),
                    color: Consts.mainColor,
                  ),
                  padding: EdgeInsets.symmetric(vertical: Consts.width(5)),
                  width: Consts.width(35),
                  height: Consts.width(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: {Resource.water, Resource.moss, Resource.energy}.map((e) =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Prefabs.image(img: e, size: 7),
                          SizedBox(width: Consts.width(3)),
                          Text(
                            '${User().inventory[e].amount}',
                            style: Consts.textStyle,
                          ),
                        ],
                      ),
                    ).toList(),
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
                  percent: 0.95,
                  animation: true,
                  radius: Consts.width(22),
                  lineWidth: Consts.width(1),
                  center: AutoSizeText(
                    "95%",
                    style: Consts.textStyle,
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTop() {
    return Padding(
      padding: EdgeInsets.all(Consts.width(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Icon(
              Icons.exit_to_app_sharp,
              size: Consts.width(9),
              color: Consts.textColor,
            ),
          ),
          InkWell(
            child: Icon(
              Icons.menu,
              size: Consts.width(9),
              color: Consts.textColor,
            ),
            onTap: () => setState(() {
              if (isCollapsed) _controller.forward();
              else _controller.reverse();
              isCollapsed = !isCollapsed;
            }),
          ),
        ],
      ),
    );
  }

}