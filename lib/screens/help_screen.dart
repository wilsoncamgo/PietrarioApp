import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/util/consts.dart';
import 'package:pietrario_sample_app/util/prefabs.dart';

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
    images = ['logo','fox','time','pietrario','settings'];
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
                section == 0
                    ? SizedBox(width: Consts.width(10))
                    : InkWell(
                        child: Icon(
                          Icons.chevron_left,
                          size: Consts.width(10),
                          color: Consts.textColor,
                        ),
                        onTap: () => setState(() => section--),
                      ),
                Text(
                  Consts.getText('help_${sections[section]}'),
                  style: Consts.textStyle,
                ),
                (section == sections.length - 1)
                    ? SizedBox(width: Consts.width(10))
                    : InkWell(
                        child: Icon(
                          Icons.chevron_right,
                          size: Consts.width(10),
                          color: Consts.textColor,
                        ),
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
                  Text(
                    Consts.getText('content_${sections[section]}'),
                    style: Consts.textStyle,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 30,),
                  section==1 ?
                  (Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: {'water', 'moss', 'energy'}
                        .map((e) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Prefabs.image(img: e, size: 20),
                              SizedBox(width: Consts.width(3)),
                            ],
                          ),
                        ).toList(),
                  )):SizedBox(width: Consts.width(10)),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: Consts.width(20)),
                    child: Prefabs.image(img:
                    images[section], size: 50, blend: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
