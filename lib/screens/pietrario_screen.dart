import 'package:flutter/cupertino.dart';
import 'package:pietrario_sample_app/controller/PietrarioCtrl.dart';
import 'package:pietrario_sample_app/model/User.dart';
import 'package:pietrario_sample_app/util/prefabs.dart';

/// @author estidlozano
class PietrarioScreen extends StatefulWidget {
  @override
  _PietrarioScreenState createState() => _PietrarioScreenState();
}

class _PietrarioScreenState extends State<PietrarioScreen> {
  @override
  Widget build(BuildContext context) {
    return Prefabs.scaffold(
      title: 'pietrario',
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, 0),
              child: Prefabs.image(img: 'base', size: 90, blend: false),
            ),
            Align(
              alignment: Alignment(-0.65, -0.35),
              child: Prefabs.image(img: 'succulent1', size: 30, blend: false),
            ),
            Align(
              alignment: Alignment(-0.85, -0.15),
              child: Prefabs.image(img: 'succulent1', size: 30, blend: false),
            ),
            Align(
              alignment: Alignment(-0.2, -0.2),
              child: Prefabs.image(img: 'succulent1', size: 30, blend: false),
            ),
            Align(
              alignment: Alignment(-0.2, 0),
              child: Prefabs.image(img: 'succulent1', size: 30, blend: false),
            ),
            Align(
              alignment: Alignment(0.35, -0.05),
              child: Prefabs.image(img: 'succulent1', size: 30, blend: false),
            ),
            Align(
              alignment: Alignment(-0.5, 0.15),
              child: Prefabs.image(img: 'succulent1', size: 30, blend: false),
            ),
            Align(
              alignment: Alignment(0.3, 0.15),
              child: Prefabs.image(img: 'succulent1', size: 30, blend: false),
            ),
            Align(
              alignment: Alignment(0.85, 0.1),
              child: Prefabs.image(img: 'succulent1', size: 30, blend: false),
            ),
          ],
        ),
      ),
    );
  }
}