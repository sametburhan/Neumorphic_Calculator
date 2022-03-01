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
        Expanded(flex: 2, child: calculationArea(context)),
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
                "15 + 20 =",
                style: TextStyle(fontSize: 38),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(
                "35",
                style: TextStyle(fontSize: 48),
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

Widget calculationArea(BuildContext context) {
  return Container(
      child: GridView.builder(
          itemCount: buttons.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            return MyButton(
              buttonText: buttons[index],
              color: color1,
              textColor: color2,
            );
          }));
}
