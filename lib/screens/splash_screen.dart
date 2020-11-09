import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/controller/InventoryCtrl.dart';
import 'package:pietrario_sample_app/controller/PietrarioCtrl.dart';
import 'package:pietrario_sample_app/screens/menu_screen.dart';
import 'package:pietrario_sample_app/util/assets.dart';
import 'package:pietrario_sample_app/util/config.dart';
import 'package:pietrario_sample_app/util/consts.dart';

/// @author estidlozano
class SplashScreen extends StatelessWidget {

  static bool loaded = false;

  @override
  Widget build(BuildContext context) {
    if(!loaded) {
      Consts.setScreenSize(MediaQuery.of(context).size);
      Consts.loadTexts();
      Config.loadConfig();
      InventoryCtrl.initInventory();
      PietrarioCtrl.initPietrario();
      Timer.periodic(Duration(seconds: 3), (time) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuScreen()));
        time.cancel();
      });
      loaded = true;
    }
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Consts.width(2)),
          child: Image.asset(
            Assets.img('logo'),
            height: Consts.width(30),
            width: Consts.width(30),
          ),
        ),
      ),
    );
  }
}
