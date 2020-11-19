import 'package:flutter/material.dart';
import 'package:pietrario_app/controller/InventoryCtrl.dart';
import 'package:pietrario_app/controller/MarketCtrl.dart';
import 'package:pietrario_app/model/Bioasset.dart';
import 'package:pietrario_app/model/Resource.dart';
import 'package:pietrario_app/model/User.dart';
import 'package:pietrario_app/util/consts.dart';
import 'package:pietrario_app/util/prefabs.dart';

/// @author estidlozano
class MarketScreen extends StatefulWidget {
  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Prefabs.scaffold(
      title: 'market',
      body: Column(
        children: [
          // TOP-BAR
          Column(
            children: [
              //Resources panel
              Container(
                padding: EdgeInsets.all(Consts.width(3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: {Resource.water, Resource.moss, Resource.energy}.map((e) =>
                    buildResource(e),
                  ).toList(),
                ),
              ),
            ],
          ),
          // MARKET SPACE
          Expanded(
            child: Container(
              padding: EdgeInsets.all(Consts.width(5)),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: Consts.width(2),
                childAspectRatio: 0.75,
                children: User().inventory.values.map((v) =>
                  InkWell(
                    child: buildBioasset(v),
                    onTap: () => showDialog(context: context,
                      builder: (BuildContext context) => buildPurchasing(v, context),
                    ),
                  ),
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildResource(String resource) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Prefabs.iconImg(img: resource, size: 7),
        Container(
          margin: EdgeInsets.only(left: Consts.width(1), right: Consts.width(5)),
          child: Prefabs.text('${InventoryCtrl.get(resource).amount}', false),
        ),
      ],
    );
  }

  Widget buildBioasset(Bioasset b) {
    return Container(
      margin: EdgeInsets.all(Consts.width(2)),
      decoration: BoxDecoration(
        color: Consts.mainColor,
        borderRadius: BorderRadius.all(Radius.circular(Consts.width(5))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Prefabs.image(img: b.name, size: 12),
          SizedBox(height: Consts.width(2)),
          buildCost(Resource.water, b.costWater),
          SizedBox(height: Consts.width(1)),
          buildCost(Resource.moss, b.costMoss),
          SizedBox(height: Consts.width(1)),
          buildCost(Resource.energy, b.costEnergy),
        ],
      ),
    );
  }

  Widget buildCost(String img, int val) {
    return val == 0 ?
    SizedBox() :
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Prefabs.iconImg(img: img, size: 5),
        SizedBox(width: Consts.width(1)),
        Prefabs.text('$val', false),
      ],
    );
  }

  Widget buildPurchasing(Bioasset b, BuildContext ctx) {
    bool canPurchase = MarketCtrl.canPurchase(b);
    return Prefabs.popUp(
        title: 'exchange',
        content: canPurchase ?
        Column(
          children: [
            buildBioasset(b),
            SizedBox(height: Consts.width(6)),
            InkWell(
              child: Prefabs.iconImg(img: 'check', size: 8),
              onTap: () => setState(() {
                MarketCtrl.purchase(b);
                Navigator.of(ctx).pop();
              }),
            ),
          ],
        ) :
        Prefabs.text('insuficient_resources'),
        ctx: ctx,
    );
  }

}
