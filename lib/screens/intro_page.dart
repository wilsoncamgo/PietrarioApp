import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/controller/InventoryCtrl.dart';
import 'package:pietrario_sample_app/screens/main_menu.dart';
import 'package:pietrario_sample_app/util/Assets.dart';

class IntroPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    InventoryController.initUserData();
    new Timer.periodic(new Duration(seconds: 3), (time) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenu()));
      time.cancel();
    });
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(w/40),
          child: Image.asset(
            Assets.img('logo'),
            height: w/3,
            width: w/3,
          ),
        ),
      ),
    );
  }
}


