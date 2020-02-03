import 'package:flutter/material.dart';
import 'package:neumorphism_web/neumorphic_bar.dart';

const num pieWidth = 400;

class NeumorphicPie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: pieWidth,
      height: pieWidth,
      decoration: BoxDecoration(
        color: exteriorShadow,
        borderRadius: BorderRadius.all(
          Radius.circular(pieWidth / 2),
        ),
      ),
      child: Center(
        child: Container(
          height: pieWidth * 0.5,
          width: pieWidth * 0.5,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(pieWidth / 2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white70,
                  spreadRadius: 1.0,
                )
              ]),
          child: Center(
            child: Container(
              height: pieWidth * 0.3,
              width: pieWidth * 0.3,
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(pieWidth / 2),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-2.5, -2.5),
                    color: shadowColor,
                    spreadRadius: 2.0,
                    // blurRadius: 0,
                  ),
                  BoxShadow(
                    offset: Offset(1.5, 1.5),
                    color: Colors.white,
                    // spreadRadius: 2.0,
                    blurRadius: 4,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final innerColor = Color.fromRGBO(233, 242, 249, 1);
final shadowColor = Color.fromRGBO(220, 227, 234, 1);
