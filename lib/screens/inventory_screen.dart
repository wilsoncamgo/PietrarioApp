import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/model/Bioasset.dart';
import 'package:pietrario_sample_app/model/User.dart';
import 'package:pietrario_sample_app/util/consts.dart';
import 'package:pietrario_sample_app/util/prefabs.dart';

class InventoryScreen extends StatefulWidget {
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Prefabs.scaffold(
      title: 'inventory',
      body: Container(
        padding: EdgeInsets.all(Consts.width(5)),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: Consts.width(2),
          childAspectRatio: 0.75,
          children: User().inventory.values.where((e) =>
          (e.amount ?? 0) > 0
          ).map((v) =>
              buildBioasset(v),
          ).toList(),
        ),
      ),
    );
  }

  Widget buildBioasset(Bioasset b) {
    return Container(
      decoration: BoxDecoration(
        color: Consts.mainColor,
        borderRadius: BorderRadius.all(Radius.circular(Consts.width(5))),
      ),
      margin: EdgeInsets.all(Consts.width(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Prefabs.image(img: b.name, size: 12, blend: false),
          SizedBox(height: Consts.width(2)),
          Text(
            '${b.amount}',
            style: Consts.textStyle,
          ),
        ],
      ),
    );
  }
}