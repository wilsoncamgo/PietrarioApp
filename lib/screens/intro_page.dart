import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset("/img/logo.png"),
          width: 124,
          height: 152,
        ),
      ),
    );
  }
}
