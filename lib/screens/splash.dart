import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/controller/InventoryCtrl.dart';
import 'package:pietrario_sample_app/screens/menu.dart';
import 'package:pietrario_sample_app/util/Assets.dart';
import 'package:pietrario_sample_app/util/Config.dart';
import 'package:pietrario_sample_app/util/Consts.dart';

/// @author estidlozano
class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Consts.setScreenSize(MediaQuery.of(context).size);
    Consts.loadTexts();
    Config.loadConfig();
    InventoryCtrl.initUserData();
    new Timer.periodic(new Duration(seconds: 3), (time) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
      time.cancel();
    });
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Consts.screenW/40),
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
