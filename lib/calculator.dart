import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator_app/common.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = "";

  @override
  void initState() {
    super.initState();
  }

  void submitInput(String input) {
    setState(() {
      userInput = "$userInput$input";
    });
  }

  void clearUserInput() {
    setState(() {
      userInput = "";
    });
  }

  void calculate() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(userInput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      String answer = eval.toString();
      setState(() {
        userInput = int.parse(answer).toString();
      });
    } catch (e) {
      error(context, 'Error in calculation');
    }
  }

  Widget _renderDisplayScreen(userInput) {
    return Container(
      color: Colors.black26,
      width: MediaQuery.of(context).copyWith().size.width,
      height: MediaQuery.of(context).copyWith().size.height * 0.3,
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Container(
          alignment: Alignment.bottomRight,
          color: Colors.white,
          child: Text("$userInput",
              style: TextStyle(color: Colors.grey, fontSize: 40.0))),
    );
  }

  Widget _renderName() {
    return Container(
        color: Colors.white60,
        width: MediaQuery.of(context).copyWith().size.width,
        height: MediaQuery.of(context).copyWith().size.height * 0.1,
        child: Center(
          child: Text('CALCULATOR APP'),
        ));
  }

  Widget _renderInputButtons() {
    TextStyle textStyle = TextStyle(fontSize: 30.0);
    return Container(
        color: Colors.white60,
        width: MediaQuery.of(context).copyWith().size.width,
        height: MediaQuery.of(context).copyWith().size.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                _inputButton(Text('√', style: textStyle), () {
                  submitInput('√');
                }),
                _inputButton(Text('%', style: textStyle), () {
                  submitInput('%');
                }),
                _inputButton(
                    Icon(
                      Icons.history,
                      size: 30,
                    ),
                    () {}),
                _inputButton(Text('Clear'), () {
                  clearUserInput();
                }),
              ],
            ),
            Row(
              children: [
                _inputButton(Text('∧2', style: textStyle), () {
                  submitInput('^2');
                }),
                _inputButton(Text('∧', style: textStyle), () {
                  submitInput('^');
                }),
                _inputButton(Text('(', style: textStyle), () {
                  submitInput('(');
                }),
                _inputButton(Text(')', style: textStyle), () {
                  submitInput(')');
                }),
              ],
            ),
            Row(
              children: [
                _inputButton(Text('1', style: textStyle), () {
                  submitInput('1');
                }),
                _inputButton(Text('2', style: textStyle), () {
                  submitInput('2');
                }),
                _inputButton(Text('3', style: textStyle), () {
                  submitInput('3');
                }),
                _inputButton(Text('+', style: textStyle), () {
                  submitInput('+');
                }),
              ],
            ),
            Row(
              children: [
                _inputButton(Text('4', style: textStyle), () {
                  submitInput('4');
                }),
                _inputButton(Text('5', style: textStyle), () {
                  submitInput('5');
                }),
                _inputButton(Text('6', style: textStyle), () {
                  submitInput('6');
                }),
                _inputButton(Text('‒', style: textStyle), () {
                  submitInput('-');
                }),
              ],
            ),
            Row(
              children: [
                _inputButton(Text('7', style: textStyle), () {
                  submitInput('7');
                }),
                _inputButton(Text('8', style: textStyle), () {
                  submitInput('8');
                }),
                _inputButton(Text('9', style: textStyle), () {
                  submitInput('9');
                }),
                _inputButton(Text('✕', style: textStyle), () {
                  submitInput('*');
                }),
              ],
            ),
            Row(
              children: [
                _inputButton(
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    () {}),
                _inputButton(Text('0', style: textStyle), () {
                  submitInput('0');
                }),
                _inputButton(Text('=', style: textStyle), () {
                  calculate();
                }),
                _inputButton(Text('÷', style: textStyle), () {
                  submitInput('/');
                }),
              ],
            ),
          ],
        ));
  }

  Widget _inputButton(content, function) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: MediaQuery.of(context).copyWith().size.width / 4,
      height: MediaQuery.of(context).copyWith().size.height * 0.1,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.blue)),
        color: Colors.blue,
        child: content,
        onPressed: function,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          // render screen
          _renderDisplayScreen(userInput),

          // render calaculator title
          _renderName(),

          // render input buttons
          _renderInputButtons()
        ],
      ),
    );
  }
}
