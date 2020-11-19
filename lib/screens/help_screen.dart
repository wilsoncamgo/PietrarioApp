import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pietrario_app/model/Resource.dart';
import 'package:pietrario_app/util/consts.dart';
import 'package:pietrario_app/util/prefabs.dart';

/// @author estidlozano
class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<String> sections;
  List images;
  int section;

  @override
  void initState() {
    super.initState();
    sections = ['introduction', 'resources', 'timer', 'pietrario', 'modes'];
    images = ['leaf','fox','time','pietrario','settings'];
    section = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Prefabs.scaffold(
      title: 'help',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SECTION
          Container(
            margin: EdgeInsets.only(top: Consts.width(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                section == 0 ?
                SizedBox(width: Consts.width(10)) : InkWell(
                  child: Prefabs.icon(Icons.chevron_left),
                  onTap: () => setState(() => section--),
                ),
                Prefabs.text('help_${sections[section]}'),
                (section == sections.length - 1) ?
                SizedBox(width: Consts.width(10)) :
                InkWell(
                  child: Prefabs.icon(Icons.chevron_right),
                  onTap: () => setState(() => section++),
                ),
              ],
            ),
          ),
          // CONTENT

          Expanded(
            child: Container(
              margin: EdgeInsets.all(Consts.width(5)),
              padding: EdgeInsets.all(Consts.width(5)),
              child: ListView(
                children: [
                  Prefabs.text('content_${sections[section]}'),
                  SizedBox(height: 30),
                  section==1 ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: {Resource.water, Resource.moss, Resource.energy}
                    .map((e) => Prefabs.iconImg(img: e, size: 20)).toList(),
                  ) :
                  SizedBox(height: 0),
                  SizedBox(height: Consts.width(10)),
                  section == 2 || section == 4 ?
                  Prefabs.iconImg(img: images[section], size: 50) :
                  Prefabs.image(img: images[section], size: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
