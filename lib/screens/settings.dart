import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/util/Config.dart';
import 'package:pietrario_sample_app/util/Consts.dart';

/// @author JuanCuevas2207
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              Consts.getText('settings'),
              style: Consts.titleStyle,
            ),
            SizedBox(
              height: Consts.width(20),
            ),
            buildSettings(),
          ],
        ),
      ),
    );
  }

  Widget buildSettings() {
    return Container(
      margin: EdgeInsets.all(Consts.width(10)),
      padding: EdgeInsets.all(Consts.width(5)),
      decoration: BoxDecoration(
        color: Consts.mainColor,
        borderRadius: BorderRadius.all(
            Radius.circular(Consts.width(5))
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Consts.getText('rigorous'),
                style: Consts.textStyle,
              ),
              Switch(
                value: Config.rigorous,
                onChanged: (v) => setState(() {
                  Config.setRigorous(v);
                }),
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Consts.getText('cloudy'),
                style: Consts.textStyle,
              ),
              Switch(
                value: Config.cloudy,
                onChanged: (v) => setState(() {
                  Config.setCloudy(v);
                }),
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Consts.getText('vibration'),
                style: Consts.textStyle,
              ),
              Switch(
                value: Config.vibration,
                onChanged: (v) => setState(() {
                  Config.setVibration(v);
                }),
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Consts.getText('language'),
                style: Consts.textStyle,
              ),
              DropdownButton(
                value: Config.getLang(),
                items: Config.langs.map((v) =>
                    DropdownMenuItem(
                      child: Text('$v'),
                      value: '$v',
                    )
                ).toList(),
                onChanged: (v) => setState(() {
                  Config.setLang(Config.langs.indexOf(v));
                }),
              )
            ],
          ),
          Row(
            children: [
              Text(
                Consts.getText('sound'),
                style: Consts.textStyle,
              ),
              Slider(
                value: Config.sound,
                min: 0,
                max: 10,
                divisions: 10,
                activeColor: Colors.lightGreenAccent,
                inactiveColor: Colors.grey,
                onChanged: (v) => setState(() {
                  Config.setSound(v);
                }),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                Consts.getText('music'),
                style: Consts.textStyle,
              ),
              Slider(
                value: Config.music,
                min: 0,
                max: 10,
                divisions: 10,
                activeColor: Colors.lightGreenAccent,
                inactiveColor: Colors.grey,
                onChanged: (v) => setState(() {
                  Config.setMusic(v);
                }),
              ),
            ],
          ),
        ],
      )
    );
  }
}