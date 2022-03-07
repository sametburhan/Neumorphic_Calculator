import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;

  MyButton({
    this.color,
    required this.buttonText,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(5),
        child: GestureDetector(
          child: NeumorphicButton(
            onPressed: () {
              print(buttonText);
            },
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ),
            style: NeumorphicStyle(
              color: color,
              shape: NeumorphicShape.concave,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
              depth: 10,
              lightSource: LightSource.topLeft,
            ),
          ),
        ),
      ),
    );
  }
}
