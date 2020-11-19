import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:pietrario_app/controller/InventoryCtrl.dart';
import 'package:pietrario_app/util/config.dart';

import 'package:pietrario_app/util/consts.dart';
import 'package:pietrario_app/util/prefabs.dart';
import 'package:pietrario_app/model/Resource.dart';

/// @author estidlozano
class TimerScreen extends StatefulWidget {
  @override
  TimeState createState() => TimeState();
}

class TimeState extends State<TimerScreen> {

  int time,
      minuts,
      seconds,
      minTime,
      maxTime,
      defaultTime,
      obtainedWater,
      obtainedMoss,
      obtainedEnergy;
  bool running,
      ended,
      vibrationSupport;

  TextField inputMinuts;
  TextEditingController inputMinutsController;
  TextStyle textStyle = TextStyle(
    fontSize: Consts.width(10),
    fontWeight: FontWeight.normal,
    letterSpacing: 1.5,
    color: Consts.textColor,
  );

  @override
  void initState() {
    super.initState();
    defaultTime = 30;
    minTime = 1;
    maxTime = 120;
    time = defaultTime;
    minuts = time;
    seconds = 0;

    running = false;
    ended = false;
    () async {
      vibrationSupport = await Vibrate.canVibrate;
    }.call();
    inputMinutsController = TextEditingController();
    inputMinutsController.text = '$defaultTime';
    inputMinuts = buildInputText(inputMinutsController);
  }

  @override
  Widget build(BuildContext context) {
    String text = running ? 'focus_time' : (ended ? 'timer_reward' : 'enter_time');
    String imgButton = running ? 'pause' : (ended ? 'check' : 'play');
    Function onTap = () => running ? stopTimer() : (ended ? checkReward() : startTimer());
    double percent = ((minuts * 60.0 + seconds)/(time * 60.0));
    return Prefabs.scaffold(
      title: 'timer',
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Prefabs.text(text),
            Prefabs.circularPercentIndicator(
              lineWidth: 2,
              percent: percent,
              radius: 60,
              center: running ?
              Text(
                '$minuts : $seconds',
                style: textStyle,
              ) :
              (ended ? buildReward() : inputMinuts),
            ),
            InkWell(
              child: Prefabs.iconImg(img: imgButton, size: 20),
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputText(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        counterText: '',
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      style: textStyle,
      textAlign: TextAlign.center,
      maxLength: 3,
      onChanged: (e) {
        int v = int.parse(inputMinutsController.text) ?? 0;
        setState(() {
          time = v < minTime ? minTime : (v > maxTime ? maxTime : v);
          minuts = time;
          seconds = 0;
          if(v != time) {
            inputMinutsController.text = '$time';
            int offset = inputMinutsController.text.length;
            inputMinutsController.selection = TextSelection(baseOffset: offset, extentOffset: offset);
          }
        });
      },
    );
  }

  Widget buildReward() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Consts.width(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: {
          Resource.water: obtainedWater,
          Resource.moss: obtainedMoss,
          Resource.energy: obtainedEnergy
        }.entries.map((e) =>
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Prefabs.iconImg(img: e.key, size: 7),
                SizedBox(width: Consts.width(3)),
                Prefabs.text('${e.value}', false),
              ],
            ),
        ).toList(),
      ),
    );
  }

  void endFocusTime() {
    double hours = time / 60;
    obtainedWater = (InventoryCtrl.getProduction(Resource.water) * hours).round();
    obtainedMoss = (InventoryCtrl.getProduction(Resource.moss) * hours).round();
    obtainedEnergy = (InventoryCtrl.getProduction(Resource.energy) * hours).round();
    InventoryCtrl.add(Resource.water, obtainedWater);
    InventoryCtrl.add(Resource.moss, obtainedMoss);
    InventoryCtrl.add(Resource.energy, obtainedEnergy);
    ended = true;
    if(vibrationSupport && Config.vibration) {
      Vibrate.vibrate();
    }
  }

  void startTimer() {
    setState(() {
      running = true;
    });
    Timer.periodic(Duration(seconds: 1), (time) {
      setState(() {
        if(!running) {
          time.cancel();
          return;
        }
        if(--seconds == -1) {
          if(--minuts == -1) {
            minuts = 0;
            seconds = 0;
            stopTimer();
            endFocusTime();
            return;
          }
          seconds = 59;
        }
      });
    });
  }

  void stopTimer() {
    setState(() {
      running = false;
      minuts = time;
      seconds = 0;
    });
  }

  void checkReward() {
    setState(() {
      ended = false;
    });
  }

}
