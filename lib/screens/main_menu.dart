import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:pietrario_sample_app/screens/market.dart';
import 'package:pietrario_sample_app/util/Assets.dart';
=======
import 'package:pietrario_sample_app/screens/settings.dart';
>>>>>>> juan

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
<<<<<<< HEAD
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
=======
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/img/leaf.png',
            width: 100.0,
            height: 100.0,
          ),
          RaisedButton(
            child: Text('Settings'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Setting()),
              );
            },
          )
        ],
>>>>>>> juan
      ),
    );
  }
}
