import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class TimeSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  TextEditingController number = new TextEditingController();
  String message = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                    labelText: "Ingrese su tiempo de concentración en minutos"),
                keyboardType: TextInputType.number,
                controller: number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: Text(
                  '$message',
                ),
              ),
              RaisedButton(
                child: Text('Iniciar'),
                onPressed: () {
                  if (int.parse(number.text) >= 5 &&
                      int.parse(number.text) <= 120) {
                    Navigator.pushNamed(context, '/timer',
                        arguments: {'time': int.parse(number.text) * 60});
                  } else {
                    setState(() {
                      message =
                          'El tiempo de concentración no debe ser mayor de 120 y menor que 10 minutos';
                    });
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green)),
              )
            ],
          )),
    );
  }
}
