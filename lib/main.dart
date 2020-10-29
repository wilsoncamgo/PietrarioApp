import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pietrario_sample_app/screens/guardian_menu.dart';
import 'package:pietrario_sample_app/screens/help_menu.dart';
import 'package:pietrario_sample_app/screens/intro_page.dart';
import 'package:pietrario_sample_app/screens/menu_dashboard.dart';
import 'package:pietrario_sample_app/screens/succulent_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HelpMenu(),
    ),
  );
}

class HelloWorld extends StatefulWidget {
  @override
  _HelloWorldState createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MenuDashboard(),
      },
    );
  }
}
