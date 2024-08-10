// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class CalcBasicView extends StatefulWidget {
  const CalcBasicView({Key? key}) : super(key: key);

  @override
  _CalcBasicViewState createState() => _CalcBasicViewState();
}

class _CalcBasicViewState extends State<CalcBasicView> {
  double num_1 = 0.0, num_2 = 0.0;
  String result = "0";
  String _result = "0";
  String expression = ""; //phép tính

  void calcHandleClicked(String btnText) {
    if (btnText == "C") {
      _result = "0";
      num_1 = 0.0;
      num_2 = 0.0;
      expression = "";
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "*" ||
        btnText == "/") {
      num_1 = double.parse(result);
      print('result_: $result');
      expression = btnText;
      _result = "0";
    } else if (btnText == '=') {
      num_2 = double.parse(result);
      print('num_2: $num_2');
      switch (expression) {
        case "+":
          _result = (num_1 + num_2).toString();
          break;
        case "-":
          _result = (num_1 - num_2).toString();
          break;
        case "*":
          _result = (num_1 * num_2).toString();
          break;
        case "/":
          if (num_2 == 0) {
            _result = "Error!";
          } else {
            _result = (num_1 / num_2).toString();
          }
          break;
        default:
          _result = "0";
          break;
      }
      num_1 = 0.0;
      num_2 = 0.0;
      expression = "";
    } else {
      _result += btnText;
    }

    setState(() {
      // if (result == "") {
      //   return;
      // } else {
      //   result = double.parse(_result).toStringAsFixed(2);
      // }
      result != "" ? result = double.parse(_result).toStringAsFixed(2) : "";
    });
  }

  Widget customOutlineButton(String value) {
    return Expanded(
      child: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 3.0, right: 3.0, top: 1.0, bottom: 1.0),
          child: OutlinedButton(
            onPressed: () => calcHandleClicked(value),
            style: OutlinedButton.styleFrom(
              backgroundColor: (value == "+" ||
                      value == "-" ||
                      value == "*" ||
                      value == "/" ||
                      value == "=" ||
                      value == "C")
                  ? Colors.orange
                  : Colors.white12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            ),
            child: Text(
              value,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 6,
        backgroundColor: Colors.black54,
        leading: const Icon(
          Icons.calculate,
          color: Colors.orange,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              'BASIC_ CALC',
              style: TextStyle(
                  color: Colors.white38,
                  fontWeight: FontWeight.w800,
                  fontSize: 26),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(10),
                child: Text(
                  result,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customOutlineButton('7'),
                customOutlineButton('8'),
                customOutlineButton('9'),
                customOutlineButton('/'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customOutlineButton('4'),
                customOutlineButton('5'),
                customOutlineButton('6'),
                customOutlineButton('*'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customOutlineButton('1'),
                customOutlineButton('2'),
                customOutlineButton('3'),
                customOutlineButton('-'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customOutlineButton(''),
                customOutlineButton('0'),
                customOutlineButton('00'),
                customOutlineButton('+'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customOutlineButton('C'),
                customOutlineButton('='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
