import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pietrario_app/controller/InventoryCtrl.dart';
import 'package:pietrario_app/controller/PietrarioCtrl.dart';
import 'package:pietrario_app/model/Bioasset.dart';
import 'package:pietrario_app/model/Guardian.dart';
import 'package:pietrario_app/model/Succulent.dart';
import 'package:pietrario_app/model/User.dart';
import 'package:pietrario_app/screens/succulent_screen.dart';
import 'package:pietrario_app/util/consts.dart';
import 'package:pietrario_app/util/prefabs.dart';

/// @author estidlozano
class PietrarioScreen extends StatefulWidget {
  @override
  _PietrarioScreenState createState() => _PietrarioScreenState();
}

class _PietrarioScreenState extends State<PietrarioScreen> {
  final MethodChannel androidChannel = MethodChannel('androidChannel');

  @override
  Widget build(BuildContext context) {
    return Prefabs.scaffold(
      title: 'pietrario',
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, 0),
              child: Prefabs.image(img: 'base', size: 90),
            ),
            buidMoss(0.5, 0.03),
            buidMoss(-0.15, 0.1),
            buidMoss(0.35, 0.13),
            buidMoss(0.85, 0.16),
            buidMoss(-0.3, 0.2),
            buidMoss(0.2, 0.23),
            buidMoss(0.7, 0.26),

            buildSucculent(-0.65, -0.35, 0),
            buildSucculent(-0.85, -0.15, 1),
            buildSucculent(-0.2, -0.25, 2),
            buildSucculent(-0.4, -0.15, 3),
            buildSucculent(-0.85, 0, 4),
            buildSucculent(-0.4, 0, 5),
            buildSucculent(0.2, -0.15, 6),
            buildSucculent(0.05, -0.02, 7),

            buildGuardian(0.35, 0),

            buildArButton(),
          ],
        ),
      ),
    );
  }

  void callBackSucculent() {
    setState(() { });
  }

  Widget buidMoss(double x, double y) {
    return Align(
      alignment: Alignment(x, y),
      child: Prefabs.image(img: 'moss1', size: 26),
    );
  }

  Widget buildGuardian(double x, double y) {
    Guardian g = PietrarioCtrl.getGuardian();
    return Align(
      alignment: Alignment(x, y),
      child: g == null ?
        InkWell(
          child: Prefabs.iconImg(img: 'guardian', size: 10),
          onTap: () => showDialog(context: context,
            builder: (BuildContext context) => buildGuardiansList(context),
          ),
        ) :
        InkWell(
          child: Prefabs.image(img: g.name, size: 25),
          onTap: () => showDialog(context: context,
            builder: (BuildContext context) => buildGuardianInfo(g, context),
          ),
        ),
    );
  }

  Widget buildGuardiansList(BuildContext context) {
    List<Widget> guardians = InventoryCtrl.getAll().values.where((e) =>
      e.type == Bioasset.typeGuardian && e.amount != 0,
    ).map((e) =>
        Container(
          margin: EdgeInsets.all(Consts.width(2)),
          child: InkWell(
            child: Prefabs.image(img: e.name, size: 12),
            onTap: () => setState(() {
              PietrarioCtrl.addGuardian(e);
              Navigator.of(context).pop();
            }),
          ),
        ),
    ).toList();
    return Prefabs.popUp(
      title: 'guardians',
      content: guardians.length == 0 ?
      Prefabs.text('no_guardians') :
      Container(
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
      ctx: context,
    );
  }

  Widget buildGuardianInfo(Guardian g, BuildContext context) {
    return Prefabs.popUp(
      title: g.name,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Prefabs.image(img: g.name, size: 25),
          SizedBox(height: Consts.width(4)),
          Prefabs.text('desc_' + g.name),
          SizedBox(height: Consts.width(4)),
          InkWell(
            child: Prefabs.iconImg(img: 'inventory', size: 15),
            onTap: () => setState(() {
              PietrarioCtrl.deleteGuardian();
              Navigator.of(context).pop();
            }),
          ),
        ],
      ),
      ctx: context,
    );
  }

  Widget buildSucculent(double x, double y, int place) {
    Succulent s = PietrarioCtrl.get(place);
    return Align(
      alignment: Alignment(x, y),
      child: s == null ?
      InkWell(
        child: Prefabs.image(img: 'leaf', size: 7),
        onTap: () => showDialog(context: context,
          builder: (BuildContext context) => buildSucculentsList(place, context),
        ),
      ) :
      Prefabs.imgRouteBtn(img: s.name, size: 25, ctx: context,
        route: SucculentScreen(
          place: place,
          callBack: () => callBackSucculent(),
        ),
      ),
    );
  }

  Widget buildSucculentsList(int place, BuildContext context) {
    List<Widget> succulents = InventoryCtrl.getAll().values.where((e) =>
      e.type == Bioasset.typeSucculent && e.amount != 0,
    ).map((e) =>
        Container(
          margin: EdgeInsets.all(Consts.width(2)),
          child: InkWell(
            child: Prefabs.image(img: e.name, size: 12),
            onTap: () => setState(() {
              PietrarioCtrl.add(e as Succulent, place);
              Navigator.of(context).pop();
            }),
          ),
        ),
    ).toList();
    return Prefabs.popUp(
      title: 'succulents',
      content: succulents.length == 0 ?
      Prefabs.text('no_succulents') :
      Container(
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
      ctx: context,
    );
  }

  Widget buildArButton() {
    return Align(
      alignment: Alignment(0.8, -0.9),
      child: InkWell(
        child: Prefabs.circularPercentIndicator(
          color: Colors.yellow,
          percent: 0.95,
          radius: 20,
          center: Prefabs.text('${User().pietrario.light}%', false),
        ),
        onTap: () => turnAr(),
      ),
    );
  }

  Future<void> turnAr() async {
    String value = 'failed';
    try {
      value = await androidChannel.invokeMethod('turnAr');
    } on PlatformException catch(e) {
      print(e);
    }
    print('pietrario ' + value);
  }
}
