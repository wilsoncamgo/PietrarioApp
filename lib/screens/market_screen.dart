import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/model/User.dart';
import 'package:pietrario_sample_app/util/assets.dart';
import 'package:pietrario_sample_app/util/consts.dart';
import 'package:pietrario_sample_app/util/prefabs.dart';

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
                  children: {'water', 'moss', 'energy'}.map((e) =>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Prefabs.image(img: e, size: 7),
                        Container(
                          margin: EdgeInsets.only(left: Consts.width(1), right: Consts.width(5)),
                          child: Text(
                            '${User().inventory[e].amount}',
                            style: Consts.textStyle,
                          ),
                        ),
                      ],
                    )
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
                  Container(
                    margin: EdgeInsets.all(Consts.width(2)),
                    decoration: BoxDecoration(
                      color: Consts.mainColor,
                      borderRadius: BorderRadius.all(Radius.circular(Consts.width(5))),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Image.asset(
                            Assets.img(v.name),
                            width: Consts.width(12),
                            height: Consts.width(12),
                          ),
                        SizedBox(height: Consts.width(2)),
                        buildCost('water', v.costWater),
                        SizedBox(height: Consts.width(1)),
                        buildCost('moss', v.costMoss),
                        SizedBox(height: Consts.width(1)),
                        buildCost('energy', v.costEnergy),
                      ],
                    ),
                  )
                ).toList(),
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget buildCost(String img, int val) {
    return val == 0 || val == null ? SizedBox() :
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Prefabs.image(img: img, size: 5),
        SizedBox(width: Consts.width(1)),
        Text(
          '$val',
          style: Consts.textStyle,
        ),
      ],
    );
  }
}