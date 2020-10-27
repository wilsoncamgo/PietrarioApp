import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/model/User.dart';
import 'package:pietrario_sample_app/util/Assets.dart';
import 'package:pietrario_sample_app/util/Consts.dart';

/// @author estidlozano
class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.bgColor,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(
        children: [
          // TOP-BAR
          Column(
            children: [
              Text(
                Consts.getText('market'),
                style: Consts.titleStyle,
              ),
              //Resources panel
              Container(
                padding: EdgeInsets.all(Consts.width(3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.img('water'),
                      width: Consts.width(7),
                      height: Consts.width(7),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Consts.width(1), right: Consts.width(5)),
                      child: Text('${User().inventory['water'].amount}'),
                    ),
                    Image.asset(
                      Assets.img('moss'),
                      width: Consts.width(7),
                      height: Consts.width(7),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Consts.width(1.5), right: Consts.width(5)),
                      child: Text('${User().inventory['moss'].amount}'),
                    ),
                    Image.asset(
                      Assets.img('energy'),
                      width: Consts.width(7),
                      height: Consts.width(7),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Consts.width(1), right: Consts.width(5)),
                      child: Text('${User().inventory['energy'].amount}'),
                    ),
                  ],
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
                    /*decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Consts.width(3)),
                      ),
                      color: Consts.mainColor,
                    ),*/
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
                        cost('water', v.costWater),
                        SizedBox(height: Consts.width(1)),
                        cost('moss', v.costMoss),
                        SizedBox(height: Consts.width(1)),
                        cost('energy', v.costEnergy),
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

  Widget cost(String img, int val) {
    return val == 0 || val == null ? SizedBox() :
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.img('$img'),
          width: Consts.width(5),
          height: Consts.width(5),
        ),
        SizedBox(width: Consts.width(1)),
        Text(
          '$val',
          style: Consts.textStyle,
        ),
      ],
    );
  }
}