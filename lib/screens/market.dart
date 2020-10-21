import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/screens/main_menu.dart';
import 'package:pietrario_sample_app/util/Assets.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    // final double w = MediaQuery.of(context).size.width;
    // final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Consts.bgColor,
      body: Column(
        children: [
          MarketBar(),
          MarketSpace(),
        ],
      ),
    );
  }
}

class MarketBar extends StatefulWidget {
  @override
  _MarketBarState createState() => _MarketBarState();
}

class _MarketBarState extends State<MarketBar> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return Column(
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
          )
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
                child: Text('100'),
              ),
              Image.asset(
                Assets.img('moss'),
                width: w/15,
                height: w/15,
              ),
              Container(
                margin: EdgeInsets.only(left: w/50, right: w/20),
                child: Text('100'),
              ),
              Image.asset(
                Assets.img('thunder'),
                width: w/15,
                height: w/15,
              ),
              Container(
                margin: EdgeInsets.only(left: w/50, right: w/20),
                child: Text('100'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MarketSpace extends StatefulWidget {
  @override
  _MarketSpaceState createState() => _MarketSpaceState();
}

class _MarketSpaceState extends State<MarketSpace> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    //final double h = MediaQuery.of(context).size.height;
    return Expanded(
        child: Container(
          padding: EdgeInsets.all(w/30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MarketItem(),
                  MarketItem(),
                  MarketItem(),
                  MarketItem(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MarketItem(),
                  MarketItem(),
                  MarketItem(),
                  MarketItem(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MarketItem(),
                  MarketItem(),
                  MarketItem(),
                  MarketItem(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MarketItem(),
                  MarketItem(),
                  MarketItem(),
                  MarketItem(),
                ],
              ),
            ],
          ),
        )
    );
  }
}

class MarketItem extends StatefulWidget {
  @override
  _MarketItemState createState() => _MarketItemState();
}

class _MarketItemState extends State<MarketItem> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    //final double h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(w/50),
      padding: EdgeInsets.all(w/30),
      //color: Consts.mainColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.img('succulent'),
            width: w/10,
            height: w/10,
          ),
          SizedBox(
            height: w/50,
          ),
          Row(
            children: [
              Image.asset(
                Assets.img('water'),
                width: w/30,
                height: w/30,
              ),
              Text(
                '100',
                style: TextStyle(
                  fontSize: w/30,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.5,
                  color: Consts.textColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                Assets.img('moss'),
                width: w/30,
                height: w/30,
              ),
              Text(
                '100',
                style: TextStyle(
                  fontSize: w/30,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.5,
                  color: Consts.textColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}