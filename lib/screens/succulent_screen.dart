import 'package:flutter/material.dart';
import 'package:pietrario_app/controller/PietrarioCtrl.dart';
import 'package:pietrario_app/model/Succulent.dart';
import 'package:pietrario_app/model/Vital.dart';
import 'package:pietrario_app/util/consts.dart';
import 'package:pietrario_app/util/prefabs.dart';

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
          Prefabs.image(img: succulent.name, size: 40),
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
          Prefabs.text('desc_' + succulent.name),
          SizedBox(height: Consts.width(15)),
          InkWell(
            child: Prefabs.iconImg(img: 'inventory', size: 15),
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
            center: Prefabs.image(img: name, size: 6),
            percent: v.value / v.maxValue,
          ),
          onTap: () => showDialog(context: context,
            builder: (BuildContext context) => Prefabs.popUp(
              title: name,
              content: buildIndicatorInfo(v, name, color),
              ctx: context,
            ),
          ),
        ),
        Prefabs.text(v.value.toString(), false),
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
              center: Prefabs.image(img: name, size: 8),
              percent: v.value / v.maxValue,
              radius: 16,
            ),
            SizedBox(height: Consts.width(4)),
            Prefabs.text('${v.value} / ${v.maxValue}', false),
            SizedBox(height: Consts.width(5)),
            PietrarioCtrl.canVitalize(v, name) ?
            InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Prefabs.iconImg(img: 'double_up'),
                    SizedBox(height: Consts.width(2)),
                    Prefabs.text('+ ${v.losingValue * 10}', false),
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
