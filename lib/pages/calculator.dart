import 'package:area_51/components/calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userQuestion = '';
  var userAnswer = '';
  bool hasDecimal = false;

  final myTextStyle = TextStyle(fontSize: 40, color: Colors.deepPurple[900]);

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  // checking if is operator
  bool isOperator(String x) {
    return x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=';
  }

  // when equal is pressed
  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      userAnswer = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  // clear btn
                  if (index == 0) {
                    return CalBtn(
                      btnTapped: () {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                          hasDecimal = false;
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.green[500],
                      textColor: Colors.white,
                    );
                  }
                  // delete btn
                  else if (index == 1) {
                    return CalBtn(
                      btnTapped: () {
                        if (userQuestion.isNotEmpty) {
                          setState(() {
                            if (userQuestion.endsWith('.')) {
                              hasDecimal = false;
                            }
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        }
                      },
                      buttonText: buttons[index],
                      color: Colors.red[700],
                      textColor: Colors.white,
                    );
                  }
                  // equal btn
                  else if (index == buttons.length - 1) {
                    return CalBtn(
                      btnTapped: () {
                        if (userQuestion.isNotEmpty) {
                          setState(() {
                            equalPressed();
                          });
                        }
                      },
                      buttonText: buttons[index],
                      color: Colors.deepPurple[100],
                      textColor: Colors.black,
                    );
                  }
                  // dot btn
                  else if (index == buttons.length - 3) {
                    return CalBtn(
                      btnTapped: () {
                        if (!hasDecimal) {
                          setState(() {
                            userQuestion += buttons[index];
                            hasDecimal = true;
                          });
                        }
                      },
                      buttonText: buttons[index],
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                    );
                  } else {
                    return CalBtn(
                      btnTapped: () {
                        setState(() {
                          if (isOperator(buttons[index])) {
                            hasDecimal = false;
                          }
                          userQuestion += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple[100]
                          : Colors.deepPurple,
                      textColor: isOperator(buttons[index])
                          ? Colors.black
                          : Colors.white,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
