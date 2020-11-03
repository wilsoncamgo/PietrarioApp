import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:pietrario_sample_app/util/Assets.dart';
import 'package:pietrario_sample_app/util/Consts.dart';


class TimerScreen extends StatefulWidget {
  @override
  TimeState createState() => TimeState();
}

class TimeState extends State<TimerScreen> {

  int time, minuts, seconds, minTime, maxTime, defaultTime;
  bool isRunning = false;

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

    inputMinutsController = TextEditingController();
    inputMinutsController.text = '$defaultTime';
    inputMinuts = buildInputText(inputMinutsController, Consts.getText('minuts'));
  }

  @override
  Widget build(BuildContext context) {
    String img = isRunning ? 'pause' : 'play';
    Function onTap = () => isRunning ? stopTimer() : startTimer();
    return new Scaffold(
      backgroundColor: Consts.bgColor,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Consts.textColor, //change your color here
        ),
        centerTitle: true,
        title: Text(
          Consts.getText('focus_timer'),
          style: Consts.titleStyle,
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Consts.getText('enter_time'),
              style: Consts.textStyle,
            ),
            CircularPercentIndicator(
              radius: Consts.width(60),
              lineWidth: Consts.width(2),
              percent: ((minuts.toDouble() * 60 + seconds)/(time.toDouble() * 60)),
              center: isRunning ?
              Text(
                '$minuts : $seconds',
                style: textStyle,
              )
              :
              inputMinuts,
              progressColor: Consts.textColor,
              backgroundColor: Consts.mainColor,
            ),
            InkWell(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(Consts.textColor, BlendMode.srcIn),
                child: Image.asset(
                  Assets.img(img),
                  width: Consts.width(20),
                  height: Consts.width(20),
                ),
              ),
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputText(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: label,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      style: textStyle,
      textAlign: TextAlign.center,// Only numbers can be entered
      onChanged: (e) {
        int v = int.parse(inputMinutsController.text ?? 0);
        setState(() {
          time = v < minTime ? minTime : (v > maxTime ? maxTime : v);
          minuts = time;
          inputMinutsController.text = '$time';
        });
      },
    );
  }

  void startTimer() {
    setState(() {
      isRunning = true;
    });
    Timer.periodic(Duration(seconds: 1), (time) {
      if(!isRunning) time.cancel();
      setState(() {
        if(--seconds == -1) {
          if(--minuts == -1) {
            minuts = 0;
            seconds = 0;
            stopTimer();
            endFocusTime();
            return;
          } else {
            seconds = 59;
          }
        }
      });
    });
  }

  void stopTimer() {
    setState(() {
      isRunning = false;
    });
  }

  void endFocusTime() {

  }

}
