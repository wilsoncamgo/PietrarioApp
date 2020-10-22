import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/screens/main_menu.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainMenu()),
              );
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/img/logo.png',
                  height: 200,
                  width: 400,),
            ),
          )
        ),
      ),
    );
  }
}


