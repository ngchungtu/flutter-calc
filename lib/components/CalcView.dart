import 'dart:math';

import 'package:calc_app/common/calcButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcView extends StatefulWidget {
  const CalcView({Key? key}) : super(key: key);

  @override
  _CalcViewState createState() => _CalcViewState();
}

class _CalcViewState extends State<CalcView> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  btnPressed(String btnText) {
    String doesContainDecimal(dynamic result) {
      if (result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if (!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
      }
      return result;
    }

    setState(() {
      if (btnText == "C") {
        equation = "0";
        result = "0";
      } else if (btnText == "<+") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (btnText == "+/-") {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
      } else if (btnText == "=") {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '%');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          if (expression.contains('%')) {
            result = doesContainDecimal('%');
          }
        } catch (e) {
          result = 'Error';
        }
      } else {
        if (equation == '0') {
          equation = btnText;
        } else {
          equation += btnText;
        }
      }
    });
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
              'CALC',
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
          //result row
          Align(
            alignment: Alignment.bottomRight,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          result,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 80),
                        ),
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: Colors.orange,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          equation,
                          style: const TextStyle(
                            color: Colors.white38,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.backspace_outlined,
                          color: Colors.orange,
                          size: 30,
                        ),
                        onPressed: () {
                          btnPressed("<+");
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //end result row
          //row 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              caclButton("C", Colors.white10, () => btnPressed("C")),
              caclButton("%", Colors.white10, () => btnPressed("%")),
              caclButton("÷", Colors.white10, () => btnPressed("÷")),
              caclButton("x", Colors.white10, () => btnPressed("x")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //row 2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              caclButton("7", Colors.white10, () => btnPressed("7")),
              caclButton("8", Colors.white10, () => btnPressed("8")),
              caclButton("9", Colors.white10, () => btnPressed("9")),
              caclButton("-", Colors.white10, () => btnPressed("-")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //row 3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              caclButton("4", Colors.white10, () => btnPressed("4")),
              caclButton("5", Colors.white10, () => btnPressed("5")),
              caclButton("6", Colors.white10, () => btnPressed("6")),
              caclButton("+", Colors.white10, () => btnPressed("+")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //row 4
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      caclButton("1", Colors.white10, () => btnPressed("1")),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      caclButton("2", Colors.white10, () => btnPressed("2")),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      caclButton("3", Colors.white10, () => btnPressed("3")),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      caclButton(
                          '+/-', Colors.white10, () => btnPressed('+/-')),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      caclButton("0", Colors.white10, () => btnPressed("0")),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      caclButton(".", Colors.white10, () => btnPressed(".")),
                      // SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                    ],
                  ),
                ],
              ),
              caclButton("=", Colors.white10, () => btnPressed("=")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
