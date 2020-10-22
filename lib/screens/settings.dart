import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/screens/main_menu.dart';
import 'package:pietrario_sample_app/util/Assets.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/img/logo.png',
              width: 100.0,
              height: 150.0,
            ),
            SettingOptions()
          ],
        ),
      ),
    );
  }
}

class SettingOptions extends StatefulWidget {
  @override
  _SettingOptionsState createState() => _SettingOptionsState();
}

class _SettingOptionsState extends State<SettingOptions> {
  static bool rigorous = false;
  static bool cloudy = false;
  static bool vibration = false;

  static double sound = 0;
  static double music = 0;

  static String language = 'Español';

  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    return Container(
        margin: EdgeInsets.all(w/10),
        padding: EdgeInsets.all(w/20),
        decoration: BoxDecoration(
            color: Consts.mainColor,
            borderRadius: BorderRadius.all(
                Radius.circular(10)
            )
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Modo riguroso', style: TextStyle(fontSize: 18.0)),
                Switch(
                  value: rigorous,
                  onChanged: (value) {
                    setState(() {
                      rigorous = value;
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Modo nublado', style: TextStyle(fontSize: 18.0)),
                Switch(
                  value: cloudy,
                  onChanged: (value) {
                    setState(() {
                      cloudy = value;
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Modo vibracion', style: TextStyle(fontSize: 18.0)),
                Switch(
                  value: vibration,
                  onChanged: (value) {
                    setState(() {
                      vibration = value;
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Idioma', style: TextStyle(fontSize: 18.0)),
                DropdownButton(
                  value: language,
                  items: [
                    DropdownMenuItem(
                      child: Text("Español"),
                      value: 'Español',
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      language = value;
                    });
                  },
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text('Sonido', style: TextStyle(fontSize: 18.0)),
                Slider(
                    value: sound,
                    min: 0,
                    max: 10,
                    divisions: 10,
                    activeColor: Colors.lightGreenAccent,
                    inactiveColor: Colors.grey,
                    onChanged: (double value) {
                      setState(() {
                        sound = value;
                      });
                    })
              ],
            ),
            Row(
              children: <Widget>[
                Text('Musica', style: TextStyle(fontSize: 18.0)),
                Slider(
                    value: music,
                    min: 0,
                    max: 10,
                    divisions: 10,
                    activeColor: Colors.lightGreenAccent,
                    inactiveColor: Colors.grey,
                    onChanged: (double value) {
                      setState(() {
                        music = value;
                      });
                    })
              ],
            ),
          ],
        ));
  }
}
