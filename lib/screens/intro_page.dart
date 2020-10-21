import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/screens/main_menu.dart';
import 'package:pietrario_sample_app/util/Assets.dart';

class IntroPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    // final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap:() => Navigator.push(context,
              MaterialPageRoute(builder: (context) => MainMenu())),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(w/40),
            child: Image.asset(
              Assets.img('logo'),
              height: w/3,
              width: w/3,
            ),
          ),
        )
      ),
    );
  }
}


