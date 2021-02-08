import 'package:flutter/material.dart';
import 'package:calculator_app/httptesting.dart';
import 'package:calculator_app/calculator.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/http': (BuildContext context) => new HttpTesting(),
        '/calculator': (BuildContext context) => new Calculator(),
      },
      initialRoute: '/calculator'
    );
  }
}
