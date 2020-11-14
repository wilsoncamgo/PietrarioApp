import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/controller/PietrarioCtrl.dart';
import 'package:pietrario_sample_app/model/Succulent.dart';
import 'package:pietrario_sample_app/model/Vital.dart';
import 'package:pietrario_sample_app/util/consts.dart';
import 'package:pietrario_sample_app/util/prefabs.dart';

class SucculentScreen extends StatefulWidget {
  int place;
  Function callBack;

  SucculentScreen({@required this.place, this.callBack});
  @override
  _SucculentScreenState createState() => _SucculentScreenState();
}

class _SucculentScreenState extends State<SucculentScreen> {

  Succulent succulent;

  _SucculentScreenState();

  @override
  void initState() {
    super.initState();
    succulent = PietrarioCtrl.get(widget.place);
  }

  void callBackIndicator() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Prefabs.scaffold(
      title: succulent.name,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Prefabs.image(
            img: succulent.name,
            size: 40,
            blend: false,
          ),
          SizedBox(height: Consts.width(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildIndicator(succulent.health, Vital.health, Consts.healthColor),
              buildIndicator(succulent.hydration, Vital.hydration, Consts.hydrationColor),
              buildIndicator(succulent.minerals, Vital.minerals, Consts.mineralsColor),
              buildIndicator(succulent.temperature, Vital.temperature, Consts.temperatureColor),
            ],
          ),
          SizedBox(height: Consts.width(15)),
          Text(
            Consts.getText('desc_' + succulent.name),
            style: Consts.textStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Consts.width(15)),
          InkWell(
            child: Prefabs.image(
              img: 'inventory',
              size: 15,
            ),
            onTap: () {
              Navigator.of(context).pop();
              PietrarioCtrl.delete(widget.place);
              widget.callBack();
            },
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(Vital v, String name, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          child: Prefabs.circularPercentIndicator(
            color: color,
            center: Prefabs.image(img: name, size: 6, blend: false),
            percent: v.value / v.maxValue,
          ),
          onTap: () => showDialog(context: context,
            builder: (BuildContext context) => Prefabs.popUp(
              title: name,
              content: buildIndicatorInfo(v, name, color),
              context: context,
            ),
          ),
        ),
        Text(
          v.value.toString(),
          style: Consts.textStyle,
        ),
      ],
    );
  }

  Widget buildIndicatorInfo(Vital v, String name, Color color) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Prefabs.circularPercentIndicator(
              color: color,
              center: Prefabs.image(img: name, size: 8, blend: false),
              percent: v.value / v.maxValue,
              radius: 16,
            ),
            SizedBox(height: Consts.width(4)),
            Text(
              '${v.value} / ${v.maxValue}',
              style: Consts.textStyle,
            ),
            SizedBox(height: Consts.width(5)),
            PietrarioCtrl.canVitalize(v, name) ?
            InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Prefabs.image(img: 'double_up'),
                    SizedBox(height: Consts.width(2)),
                    Text(
                      '+ ${v.losingValue * 10}',
                      style: Consts.textStyle,
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    if (PietrarioCtrl.vitalize(v, name)) {
                      PietrarioCtrl.update(succulent, widget.place);
                    }
                  });
                  callBackIndicator();
                }
            ) : SizedBox(),
          ],
        );
      }
    );
  }

}