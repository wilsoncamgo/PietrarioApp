import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/util/assets.dart';
import 'package:pietrario_sample_app/util/config.dart';
import 'package:pietrario_sample_app/util/consts.dart';
import 'package:pietrario_sample_app/util/prefabs.dart';

/// @author JuanCuevas2207
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Prefabs.scaffold(title: 'settings',
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSettings(),
              ],
            ),
          ),
          buildBulb(),
        ],
      ),
    );
  }

  Widget buildBulb() {
    return Align(
      alignment: Alignment(0.8, -1),
      child: Column(
        children: [
          SizedBox(
            width: Consts.width(0.6),
            height: Consts.width(25),
            child: Container(
              color: Consts.textColor,
            ),
          ),
          InkWell(
            child: Image.asset(
              Assets.img(Config.dark ? 'bulb_off' : 'bulb'),
              width: Consts.width(14),
              height: Consts.width(14),
            ),
            onTap: () => setState(() {
              Config.setDark(!Config.dark);
            }),
          ),
        ],
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
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
                inactiveThumbColor: Consts.bgColor,
                inactiveTrackColor: Consts.scndColor,
                onChanged: (v) => setState(() {
                  Config.setRigorous(v);
                }),
              ),
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
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
                inactiveThumbColor: Consts.bgColor,
                inactiveTrackColor: Consts.scndColor,
                onChanged: (v) => setState(() {
                  Config.setCloudy(v);
                }),
              ),
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
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
                inactiveThumbColor: Consts.bgColor,
                inactiveTrackColor: Consts.scndColor,
                onChanged: (v) => setState(() {
                  Config.setVibration(v);
                }),
              ),
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
                dropdownColor: Consts.mainColor,
                style: Consts.textStyle,
                items: Config.langs.map((v) =>
                    DropdownMenuItem(
                      child: Text('$v'),
                      value: '$v',
                    )
                ).toList(),
                onChanged: (v) => setState(() {
                  Config.setLang(Config.langs.indexOf(v));
                }),
              ),
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
                inactiveColor: Consts.scndColor,
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
      ),
    );
  }
}