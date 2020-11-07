import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pietrario_sample_app/screens/splash_screen.dart';

/// DO NOT EDIT THIS FILE
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
