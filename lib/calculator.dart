import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget _renderDisplayScreen() {
    return Container(
        color: Colors.black26,
        width: MediaQuery.of(context).copyWith().size.width,
        height: MediaQuery.of(context).copyWith().size.height * 0.3,
        child: SizedBox());
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
                _inputButton(Text('√', style: textStyle), () {}),
                _inputButton(Text('%', style: textStyle), () {}),
                _inputButton(Icon(Icons.history, size: 30,), () {}),
                _inputButton(Text('Clear'), () {}),
              ],
            ),
            Row(
              children: [
                _inputButton(Text('∧2', style: textStyle), () {}),
                _inputButton(Text('∧', style: textStyle), () {}),
                _inputButton(Text('(', style: textStyle), () {}),
                _inputButton(Text(')', style: textStyle), () {}),
              ],
            ),
            Row(
              children: [
                _inputButton(Text('1', style: textStyle), () {}),
                _inputButton(Text('2', style: textStyle), () {}),
                _inputButton(Text('3', style: textStyle), () {}),
                _inputButton(Text('+', style: textStyle), () {}),
              ],
            ),
            Row(
              children: [
                _inputButton(Text('4', style: textStyle), () {}),
                _inputButton(Text('5', style: textStyle), () {}),
                _inputButton(Text('6', style: textStyle), () {}),
                _inputButton(Text('‒', style: textStyle), () {}),
              ],
            ),
            Row(
              children: [
                _inputButton(Text('7', style: textStyle), () {}),
                _inputButton(Text('8', style: textStyle), () {}),
                _inputButton(Text('9', style: textStyle), () {}),
                _inputButton(Text('✕', style: textStyle), () {}),
              ],
            ),
            Row(
              children: [
                _inputButton(Icon(Icons.arrow_back, size: 30,), () {}),
                _inputButton(Text('0', style: textStyle), () {}),
                _inputButton(Text('=', style: textStyle), () {}),
                _inputButton(Text('÷', style: textStyle), () {}),
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
          _renderDisplayScreen(),

          // render calaculator title
          _renderName(),

          // render input buttons
          _renderInputButtons()
        ],
      ),
    );
  }
}
