import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:test_1/buttons.dart';
import 'package:test_1/constants/constants.dart';

class CalculatorProject extends StatefulWidget {
  const CalculatorProject({Key? key}) : super(key: key);

  @override
  _CalculatorProjectState createState() => _CalculatorProjectState();
}

class _CalculatorProjectState extends State<CalculatorProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: contents(),
      ),
    );
  }
}

var userQuestion = "";
var userAnsver = "";

class contents extends StatefulWidget {
  const contents({
    Key? key,
  }) : super(key: key);

  @override
  State<contents> createState() => _contentsState();
}

final List<String> buttons = [
  "C",
  "DEL",
  "%",
  "/",
  "7",
  "8",
  "9",
  "x",
  "4",
  "5",
  "6",
  "-",
  "1",
  "2",
  "3",
  "+",
  ".",
  "0",
  "ANS",
  "=",
];

class _contentsState extends State<contents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: calculationTable(context),
        ),
        Expanded(flex: 2, child: calculationButton(context)),
      ],
    );
  }

  Widget calculationTable(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: -10,
          lightSource: LightSource.topLeft,
          color: color1,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding:
                  EdgeInsets.only(right: 20, left: 20, top: 50, bottom: 20),
              child: Text(
                userQuestion,
                style: TextStyle(fontSize: 38, color: color3),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(
                userAnsver,
                style: TextStyle(fontSize: 48, color: color4),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .75,
                  child: Container(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget calculationButton(BuildContext context) {
  return Container(
      padding: EdgeInsets.all(12),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: buttons.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return MyButton(
                buttonText: buttons[index],
                color: color2,
                textColor: color1,
              );
            } else if (index == 1) {
              return MyButton(
                buttonText: buttons[index],
                color: color5,
                textColor: color1,
              );
            } else {
              return MyButton(
                buttonText: buttons[index],
                color: isOperator(buttons[index]) ? color3 : color1,
                textColor: isOperator(buttons[index]) ? color1 : color3,
                buttonTapped: () {
                  setState() {
                    userQuestion = userQuestion + buttons[index];
                  }
                },
              );
            }
          }));
}

bool isOperator(String x) {
  if (x == "%" || x == "/" || x == "x" || x == "+" || x == "-" || x == "=") {
    return true;
  }
  return false;
}
