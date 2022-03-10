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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              // padding: EdgeInsets.only(right: 20, left: 20, top: 50, bottom: 20),
              child: Text(
                result,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .07,
                    color: color3),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              //padding: EdgeInsets.all(20),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .1,
                    color: color4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;
  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(buttonText) {
    if (buttonText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (buttonText == "C") {
      var text1 = text.toString();
      text = text1.substring(0, text1.length - 1);
      var a1 = numOne.toString();
      var b1 = a1.substring(0, a1.length - 1);
      numOne = double.parse(b1);
      var a2 = numTwo.toString();
      var b2 = a2.substring(0, a2.length - 1);
      numTwo = double.parse(b2);

      var result1 = result.toString();

      if (result1.length >= 1) {
        result = result1.substring(0, result1.length - 1);
      } else {
        result = "";
      }
      var finalResult1 = finalResult.toString();
      if (result1.length >= 1) {
        finalResult = finalResult1.substring(0, finalResult1.length - 1);
      }
      opr = '';
      preOpr = '';
    } else if (opr == '=' && buttonText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/' ||
        buttonText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(finalResult);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = buttonText;
      result = '';
    } else if (buttonText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (buttonText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (buttonText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + buttonText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

  Widget Buttons(String buttonText, Color buttonColor, Color textColor) {
    return NeumorphicButton(
      onPressed: () {
        calculation(buttonText);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.width * .15,
        width: MediaQuery.of(context).size.width * .11,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: MediaQuery.of(context).size.width * .06,
            ),
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
            Container(
                width: MediaQuery.of(context).size.width * .43,
                child: Buttons("0", color1, color4)),
            Buttons(".", color1, color4),
            Buttons("=", color3, color1)
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * .04,
        )
      ],
    );
  }
}
