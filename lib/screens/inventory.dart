import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/model/User.dart';
import 'package:pietrario_sample_app/util/Assets.dart';
import 'package:pietrario_sample_app/util/Consts.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Consts.textColor, //change your color here
        ),
        centerTitle: true,
        title: Text(
          Consts.getText('inventory'),
          style: Consts.titleStyle,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            buildInventory(),
          ],
        ),
      ),
    );
  }

  Widget buildInventory() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(Consts.width(5)),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: Consts.width(2),
          childAspectRatio: 0.75,
          children: User().inventory.values.where((e) =>
            (e.amount ?? 0) > 0
          ).map((v) =>
            Container(
              decoration: BoxDecoration(
                color: Consts.mainColor,
                borderRadius: BorderRadius.all(Radius.circular(Consts.width(5))),
              ),
              margin: EdgeInsets.all(Consts.width(2)),
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
                  Text(
                    '${v.amount}',
                    style: Consts.textStyle,
                  ),
                ],
              ),
            ),
          ).toList(),
        ),
      )
    );
  }
}