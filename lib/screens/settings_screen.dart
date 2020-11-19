import 'package:flutter/material.dart';
import 'package:pietrario_app/util/config.dart';
import 'package:pietrario_app/util/consts.dart';
import 'package:pietrario_app/util/prefabs.dart';

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
            child: Config.dark ?
            Prefabs.iconImg(img: 'bulb', size: 14,
              filter: ColorFilter.mode(Colors.blue[700], BlendMode.modulate),
            ) :
            Prefabs.image(img: 'bulb', size: 14),
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
          Prefabs.switchBtn(
            text: 'rigorous',
            value: Config.rigorous,
            onChanged: (v) => setState(() {
              Config.setRigorous(v);
            }),
          ),
          Prefabs.switchBtn(
            text: 'cloudy',
            value: Config.cloudy,
            onChanged: (v) => setState(() {
              Config.setCloudy(v);
            }),
          ),
          Prefabs.switchBtn(
            text: 'vibration',
            value: Config.vibration,
            onChanged: (v) => setState(() {
              Config.setVibration(v);
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Prefabs.text('language'),
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
          Prefabs.sliderBtn(
            text: 'sound',
            value: Config.sound,
            onChanged: (v) => setState(() {
              Config.setSound(v);
            }),
          ),
          Prefabs.sliderBtn(
            text: 'music',
            value: Config.music,
            onChanged: (v) => setState(() {
              Config.setMusic(v);
            }),
          ),
        ],
      ),
    );
  }
}
