import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:test_1/constants/constants.dart';
import 'package:math_expressions/math_expressions.dart';

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
        child: Container(child: contents()),
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

Widget Buttons(String buttonText, Color buttonColor, Color textColor) {
  return NeumorphicButton(
    onPressed: () {},
    child: SizedBox(
      height: 65,
      width: 50,
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(color: textColor, fontSize: 25),
        ),
      ),
    ),
    style: NeumorphicStyle(
      color: buttonColor,
      shape: NeumorphicShape.concave,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
      depth: 10,
      lightSource: LightSource.topLeft,
    ),
  );
}

Widget calculationButton(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Buttons("AC", color2, color1),
          Buttons("C", color5, color1),
          Buttons("+/-", color3, color1),
          Buttons("/", color3, color1)
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Buttons("7", color1, color4),
          Buttons("8", color1, color4),
          Buttons("9", color1, color4),
          Buttons("x", color3, color1)
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Buttons("4", color1, color4),
          Buttons("5", color1, color4),
          Buttons("6", color1, color4),
          Buttons("-", color3, color1)
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Buttons("1", color1, color4),
          Buttons("2", color1, color4),
          Buttons("3", color1, color4),
          Buttons("+", color3, color1)
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(width: 180, child: Buttons("0", color1, color4)),
          Buttons(".", color1, color4),
          // Buttons("ANS", color1, color4),
          Buttons("=", color3, color1)
        ],
      ),
    ],
  );
}
