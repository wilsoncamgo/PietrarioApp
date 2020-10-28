import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pietrario_sample_app/screens/timer.dart';
import 'package:pietrario_sample_app/util/Consts.dart';


class TimeSelection extends StatefulWidget {
  @override
  TimeState createState() => TimeState();
}

class TimeState extends State<TimeSelection> {
  TextEditingController number = new TextEditingController();
  String message = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Consts.bgColor,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
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
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => Timer(myInt: int.parse(number.text),)
                        )
                    );
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
