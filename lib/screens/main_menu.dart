import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/screens/market.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/img/logo.png',
            width: 100.0,
            height: 100.0,
          ),
        ],
      ),
    );
  }
}