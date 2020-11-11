import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HelpMenu extends StatelessWidget {
  const HelpMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 36,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "Ayuda",
                      textAlign: TextAlign.center,
                      maxFontSize: 20,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 36,
                    width: 36,
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                //Puedes crear una lista de objetos para cada item o puedes usar el generador de esta
                children: List.generate(4, (index) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Image(
                            image: AssetImage('assets/coin.png'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          "Recursos",
                          maxFontSize: 20,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
