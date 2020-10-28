import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SucculentMenu extends StatelessWidget {
  const SucculentMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          buildEnvironment(),
          Align(
            alignment: Alignment(-1.4, -0.6),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              padding: EdgeInsets.only(
                left: 40,
                top: 50,
                bottom: 30,
              ),
              child: Text("Mi Teyuna Parte 2"),
              width: 200,
              height: 200,
            ),
          ),
          Align(
            alignment: Alignment(-1.9, 0.1),
            child: Image(
              image: AssetImage('assets/succulent.png'),
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEnvironment() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              child: Column(
                children: [
                  SizedBox(
                    width: 3,
                    height: 100,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/bulb.png'),
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    AutoSizeText(
                      "Salud",
                      minFontSize: 14,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF0065FD),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          width: 100,
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF0065FD),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            color: Color(0xFF0065FD),
                          ),
                          width: 0.4 * 100,
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    AutoSizeText(
                      "Hidratacion",
                      minFontSize: 14,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF0093FD),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          width: 100,
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF0093FD),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            color: Color(0xFF0093FD),
                          ),
                          width: 0.4 * 100,
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    AutoSizeText(
                      "Minerales",
                      minFontSize: 14,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF808080),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          width: 100,
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF808080),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            color: Color(0xFF808080),
                          ),
                          width: 0.4 * 100,
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    AutoSizeText(
                      "Temperatura",
                      minFontSize: 14,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFFF4500),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          width: 100,
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFFF4500),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            color: Color(0xFFFF4500),
                          ),
                          width: 0.4 * 100,
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  child: Image(
                    image: AssetImage('assets/fox_lowpoly.png'),
                    width: 149,
                    height: 210,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
