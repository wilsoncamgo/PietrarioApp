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
                padding: EdgeInsets.all(Consts.screenW/30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.img('water'),
                      width: Consts.screenW/15,
                      height: Consts.screenW/15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Consts.screenW/50, right: Consts.screenW/20),
                      child: Text('${User().inventory['water'].amount}'),
                    ),
                    Image.asset(
                      Assets.img('moss'),
                      width: Consts.screenW/15,
                      height: Consts.screenW/15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Consts.screenW/50, right: Consts.screenW/20),
                      child: Text('${User().inventory['moss'].amount}'),
                    ),
                    Image.asset(
                      Assets.img('energy'),
                      width: Consts.screenW/15,
                      height: Consts.screenW/15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Consts.screenW/50, right: Consts.screenW/20),
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
              padding: EdgeInsets.all(Consts.screenW/30),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: Consts.screenW/40,
                childAspectRatio: 0.75,
                children: User().inventory.values.map((v) =>
                  Container(
                    margin: EdgeInsets.all(Consts.screenW/60),
                    // color: Consts.mainColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.img(v.name),
                          width: Consts.screenW/10,
                          height: Consts.screenW/10,
                        ),
                        SizedBox(
                          height: Consts.screenW/50,
                        ),
                        cost('water', v.costWater),
                        cost('moss', v.costMoss),
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
    print('$img $val');
    return val == 0 || val == null ? SizedBox() :
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.img('$img'),
          width: Consts.screenW/30,
          height: Consts.screenW/30,
        ),
        Text(
          '$val',
          style: Consts.textStyle,
        ),
      ],
    );
  }
}