import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/util/Consts.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              Consts.getText('inventory'),
              style: Consts.titleStyle,
            ),
            SizedBox(
              height: Consts.width(20),
            ),
            buildInventory(),
          ],
        ),
      ),
    );
  }

  Widget buildInventory() {
    return Container(
      margin: EdgeInsets.all(Consts.width(10)),
      padding: EdgeInsets.all(Consts.width(5)),
      decoration: BoxDecoration(
        color: Consts.mainColor,
        borderRadius: BorderRadius.all(
            Radius.circular(Consts.width(5))
        ),
      ),
      child: Row(

      )
    );
  }
}