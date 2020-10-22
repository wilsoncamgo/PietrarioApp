import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/model/User.dart';
import 'package:pietrario_sample_app/screens/main_menu.dart';
import 'package:pietrario_sample_app/util/Assets.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    // final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Consts.bgColor,
      body: Column(
        children: [
          // TOP-BAR
          Column(
            children: [
              // Title and back button
              Container(
                padding: EdgeInsets.all(w/30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:() => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainMenu())),
                      child: Transform.rotate(
                        angle: Math.pi,
                        child: Image.asset(
                          Assets.img('next'),
                          width: w/12,
                          height: w/12,
                        ),
                      ),
                    ),
                    Text(
                      'Mercado',
                      style: TextStyle(
                        fontSize: w/20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Consts.textColor,
                      ),
                    ),
                    SizedBox(
                      width: w/12,
                    ),
                  ],
                ),
              ),
              //Resources panel
              Container(
                padding: EdgeInsets.all(w/30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.img('water'),
                      width: w/15,
                      height: w/15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: w/50, right: w/20),
                      child: Text('${User().inventory['water'].amount}'),
                    ),
                    Image.asset(
                      Assets.img('moss'),
                      width: w/15,
                      height: w/15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: w/50, right: w/20),
                      child: Text('${User().inventory['moss'].amount}'),
                    ),
                    Image.asset(
                      Assets.img('energy'),
                      width: w/15,
                      height: w/15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: w/50, right: w/20),
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
              padding: EdgeInsets.all(w/30),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: w/40,
                childAspectRatio: 0.75,
                children: User().inventory.values.map((v) =>
                  Container(
                    margin: EdgeInsets.all(w/60),
                    // color: Consts.mainColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.img(v.name),
                          width: w/10,
                          height: w/10,
                        ),
                        SizedBox(
                          height: w/50,
                        ),
                        cost(w, 'water', v.costWater),
                        cost(w, 'moss', v.costMoss),
                        cost(w, 'energy', v.costEnergy),
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

  Widget cost(double w, String img, int val) {
    print('$img $val');
    return val == 0 || val == null ? SizedBox() :
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.img('$img'),
          width: w/30,
          height: w/30,
        ),
        Text(
          '$val',
          style: TextStyle(
            fontSize: w/30,
            fontWeight: FontWeight.normal,
            letterSpacing: 1.5,
            color: Consts.textColor,
          ),
        ),
      ],
    );
  }
}