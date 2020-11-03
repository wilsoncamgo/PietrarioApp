import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/util/consts.dart';
import 'package:pietrario_sample_app/util/prefabs.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

  List<String> sections;
  int section;

  @override
  void initState() {
    super.initState();
    sections = ['introduction', 'resources', 'market'];
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
                  section == 0 ? SizedBox(width: Consts.width(10)) : InkWell(
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
                  (section == sections.length - 1) ? SizedBox(width: Consts.width(10)) : InkWell(
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
                child: ListView (
                  children: [

                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}