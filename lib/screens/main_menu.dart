import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/screens/market.dart';
import 'package:pietrario_sample_app/util/Assets.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                /*onTap:() => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PietrarioMenu())),*/
                child: Image.asset(
                  Assets.img('logo'),
                  width: h / 8,
                  height: h / 8,
                ),
              ),
              InkWell(
                onTap:() => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Market())),
                child: Image.asset(
                  Assets.img('market'),
                  width: h / 8,
                  height: h / 8,
                ),
              ),
            ],
          )
      ),
    );
  }
}