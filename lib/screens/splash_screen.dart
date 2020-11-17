import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pietrario_app/controller/InventoryCtrl.dart';
import 'package:pietrario_app/controller/PietrarioCtrl.dart';
import 'package:pietrario_app/screens/menu_screen.dart';
import 'package:pietrario_app/util/config.dart';
import 'package:pietrario_app/util/consts.dart';

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
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MenuScreen()));
        time.cancel();
      });
      loaded = true;
    }
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.img('leaf'),
          width: Consts.width(30),
          height: Consts.width(30),
        ),
      ),
    );
  }
}
