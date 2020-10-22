import 'package:flutter/material.dart';
import 'file:///C:/Users/cesar/OneDrive/Escritorio/flutter%20test/timer3/lib/timer/time_selection.dart';
import 'file:///C:/Users/cesar/OneDrive/Escritorio/flutter%20test/timer3/lib/timer/timer.dart';

void main() => runApp(MaterialApp(initialRoute: '/',
    routes: {
      '/': (context) => TimeSelection(),
      '/timer': (context) => Timer(),
    }));
