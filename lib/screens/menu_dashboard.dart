import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MenuDashboard extends StatefulWidget {
  MenuDashboard({Key key}) : super(key: key);

  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        left: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(-1.5, -0.6),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Color(0xFFC8C8C8),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                width: 180,
                height: 183,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(
                          image: AssetImage('assets/water.png'),
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AutoSizeText(
                          "30%",
                          minFontSize: 20,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(
                          image: AssetImage('assets/moss.png'),
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AutoSizeText(
                          "40%",
                          minFontSize: 20,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(
                          image: AssetImage('assets/lightning.png'),
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AutoSizeText(
                          "80%",
                          minFontSize: 20,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.8, -0.6),
              child: CircularPercentIndicator(
                animationDuration: 100,
                animateFromLastPercent: true,
                arcType: ArcType.FULL,
                backgroundColor: Colors.white,
                progressColor: Colors.yellow,
                percent: 0.5,
                animation: true,
                radius: 91.0,
                lineWidth: 3.0,
                center: AutoSizeText(
                  "50%",
                  minFontSize: 20,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.exit_to_app_sharp,
                          size: 36,
                        ),
                      ),
                      Container(
                        child: Image(
                          image: AssetImage('assets/logo.png'),
                          width: 75,
                          height: 75,
                        ),
                        width: 75,
                        height: 90,
                      ),
                      InkWell(
                        child: Icon(
                          Icons.menu,
                          size: 36,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      InkWell(
                        child: Image(
                          image: AssetImage('assets/mountain-2.png'),
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Align(
                        alignment: Alignment(-1, 1),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          width: 69,
                          height: 69,
                          child: Center(
                            child: InkWell(
                              child: Image(
                                image: AssetImage('assets/ar.png'),
                                width: 49,
                                height: 49,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
