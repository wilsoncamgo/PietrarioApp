import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/controller/InventoryCtrl.dart';
import 'package:pietrario_sample_app/controller/PietrarioCtrl.dart';
import 'package:pietrario_sample_app/model/Guardian.dart';
import 'package:pietrario_sample_app/model/Succulent.dart';
import 'package:pietrario_sample_app/util/consts.dart';
import 'package:pietrario_sample_app/util/prefabs.dart';
import 'package:pietrario_sample_app/util/tools.dart';

/// @author estidlozano
class PietrarioScreen extends StatefulWidget {
  @override
  _PietrarioScreenState createState() => _PietrarioScreenState();
}

class _PietrarioScreenState extends State<PietrarioScreen> {
  @override
  Widget build(BuildContext context) {
    return Prefabs.scaffold(
      title: 'pietrario',
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, 0),
              child: Prefabs.image(img: 'base', size: 90, blend: false),
            ),
            buildMoss(0.5, 0.03),
            buildMoss(-0.15, 0.1),
            buildMoss(0.35, 0.13),
            buildMoss(0.85, 0.16),
            buildMoss(-0.3, 0.2),
            buildMoss(0.2, 0.23),
            buildMoss(0.7, 0.26),

            buildSucculent(-0.65, -0.35, 0),
            buildSucculent(-0.85, -0.15, 1),
            buildSucculent(-0.2, -0.25, 2),
            buildSucculent(-0.4, -0.15, 3),
            buildSucculent(-0.85, 0, 4),
            buildSucculent(-0.4, 0, 5),
            buildSucculent(0.2, -0.15, 6),
            buildSucculent(0.05, -0.02, 7),

            buildGuardian(0.35, 0),
          ],
        ),
      ),
    );
  }

  Widget buildMoss(double x, double y) {
    return Align(
      alignment: Alignment(x, y),
      child: Prefabs.image(img: 'moss1', size: 26, blend: false),
    );
  }

  Widget buildGuardian(double x, double y) {
    Guardian g = PietrarioCtrl.getGuardian();
    return Align(
      alignment: Alignment(x, y),
      child: g == null ?
        InkWell(
          child: Prefabs.image(img: 'guardian', size: 10, blend: false),
          onTap: () => showDialog(context: context,
            builder: (BuildContext context) => buildGuardiansList(context),
          ),
        ) :
        InkWell(
          child: Prefabs.image(img: g.name, size: 25, blend: false),
          onTap: () => showDialog(context: context,
            builder: (BuildContext context) => buildGuardianInfo(g, context),
          ),
        ),
    );
  }

  Widget buildGuardiansList(BuildContext context) {
    List<Widget> guardians = InventoryCtrl.getAll().values.where((e) =>
      e.type == 'guardian' && e.amount != 0,
    ).map((e) =>
        Container(
          margin: EdgeInsets.all(Consts.width(2)),
          child: InkWell(
            child: Prefabs.image(img: e.name, size: 12, blend: false),
            onTap: () => setState(() {
              PietrarioCtrl.putGuardian(e);
              Navigator.of(context).pop();
            }),
          ),
        ),
    ).toList();
    return Prefabs.popUp(
      title: 'guardians',
      content: guardians.length == 0 ?
        Text(
          Consts.getText('no_guardians'),
          style: Consts.textStyle,
        ) : Container(
          width: Consts.width(70),
          height: Consts.width(70),
          padding: EdgeInsets.all(Consts.width(5)),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: Consts.width(2),
            childAspectRatio: 0.75,
            children: guardians,
          ),
        ),
      context: context,
    );
  }

  Widget buildGuardianInfo(Guardian g, BuildContext context) {
    return Prefabs.popUp(
      title: 'guardian',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            g.name,
            style: Consts.textStyle,
          ),
          SizedBox(height: Consts.width(4)),
          Prefabs.image(
            img: g.name,
            size: 25,
            blend: false,
          ),
          SizedBox(height: Consts.width(4)),
          Text(
            Consts.getText('desc_' + g.name),
            style: Consts.textStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Consts.width(4)),
          InkWell(
            child: Prefabs.image(
              img: 'inventory',
              size: 15,
            ),
            onTap: () => setState(() {
              PietrarioCtrl.dropGuardian();
              Navigator.of(context).pop();
            }),
          ),
        ],
      ),
      context: context,
    );
  }

  Widget buildSucculent(double x, double y, int place) {
    Succulent s = PietrarioCtrl.get(place);
    return Align(
      alignment: Alignment(x, y),
      child: s == null ?
      InkWell(
        child: Prefabs.image(img: 'leaf', size: 7, blend: false),
        onTap: () => showDialog(context: context,
          builder: (BuildContext context) => buildSucculentsList(place, context),
        ),
      ) :
      InkWell(
        child: Prefabs.image(img: s.name, size: 25, blend: false),
        onTap: () => showDialog(context: context,
          builder: (BuildContext context) => buildSucculentInfo(place, context),
        ),
      ),
    );
  }

  Widget buildSucculentInfo(int place, BuildContext context) {
    Succulent s = PietrarioCtrl.get(place);
    return Prefabs.popUp(
      title: 'succulent',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            s.name,
            style: Consts.textStyle,
          ),
          SizedBox(height: Consts.width(4)),
          Prefabs.image(
            img: s.name,
            size: 25,
            blend: false,
          ),
          SizedBox(height: Consts.width(4)),
          Text(
            Consts.getText('desc_' + s.name),
            style: Consts.textStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Consts.width(4)),
          InkWell(
            child: Prefabs.image(
              img: 'inventory',
              size: 15,
            ),
            onTap: () => setState(() {
              PietrarioCtrl.drop(place);
              Navigator.of(context).pop();
            }),
          ),
          SizedBox(height: Consts.width(4)),
          Text(
            Consts.getText('statistics'),
            style: Consts.titleStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Consts.width(4)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Tools.progressCircle(s.hydration.value, s.hydration.maxValue, "water2", Consts.water),
              Tools.progressCircle(s.minerals.value, s.minerals.maxValue, "mineral", Consts.minerals),
              Tools.progressCircle(s.temperature.value, s.temperature.maxValue, "temperature", Consts.temperature),
            ],
          ),
        ],
      ),
      context: context,
    );
  }

  Widget buildSucculentsList(int place, BuildContext context) {
    List<Widget> succulents = InventoryCtrl.getAll().values.where((e) =>
      e.type == 'succulent' && e.amount != 0,
    ).map((e) =>
        Container(
          margin: EdgeInsets.all(Consts.width(2)),
          child: InkWell(
            child: Prefabs.image(img: e.name, size: 12, blend: false),
            onTap: () => setState(() {
              PietrarioCtrl.put(e as Succulent, place);
              Navigator.of(context).pop();
            }),
          ),
        ),
    ).toList();
    return Prefabs.popUp(
      title: 'succulents',
      content: succulents.length == 0 ?
      Text(
        Consts.getText('no_succulents'),
        style: Consts.textStyle,
      ) : Container(
        width: Consts.width(70),
        height: Consts.width(70),
        padding: EdgeInsets.all(Consts.width(5)),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: Consts.width(2),
          childAspectRatio: 0.75,
          children: succulents,
        ),
      ),
      context: context,
    );
  }
}