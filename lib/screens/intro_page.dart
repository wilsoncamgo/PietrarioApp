import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Insert Image Demo'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/img/ar.png'),
            ],
          ),
        ),
      ),
    );
  }
}
