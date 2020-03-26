import 'package:flutter/material.dart';
import 'package:neumorphism_web/timer/digital_font/digital_colon.dart';
import 'package:neumorphism_web/timer/digital_font/digital_number.dart';

class NeuDigitalClock extends StatelessWidget {
  const NeuDigitalClock({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 230, 243, 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-5, -5),
            blurRadius: 15,
          ),
          BoxShadow(
            color: Color.fromRGBO(214, 223, 230, 1),
            offset: Offset(10.5, 10.5),
            blurRadius: 15,
          ),
        ],
      ),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxHeight = constraints.maxHeight;
            final maxWidth = constraints.maxWidth;
            return Container(
              height: maxHeight * 0.88,
              width: maxWidth * 0.95,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(203, 211, 196, 1),
                      Color.fromRGBO(176, 188, 163, 1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromRGBO(168, 168, 168, 1),
                    width: 2,
                  )),
              child: DigitalClock(maxHeight: maxHeight, maxWidth: maxWidth),
            );
          },
        ),
      ),
    );
  }
}

class DigitalClock extends StatelessWidget {
  const DigitalClock({
    Key key,
    @required this.maxHeight,
    @required this.maxWidth,
  }) : super(key: key);

  final double maxHeight;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final hours = createNumberTime(0);
    final minutes = createNumberTime(59);
    final seconds = createNumberTime(26);
    return Center(
        child: Container(
      height: maxHeight * 0.5,
      width: maxWidth * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ...hours,
          DigitalColon(height: maxHeight * 0.3, color: Colors.black87),
          ...minutes,
          DigitalColon(height: maxHeight * 0.3, color: Colors.black87),
          ...seconds,
        ],
      ),
    ));
  }

  List<DigitalNumberWithBG> createNumberTime(int numberTime) {
    final parsedNumberTime = numberTime % 60;
    final isNumberTwoDigits = parsedNumberTime.toString().length == 2;
    final firstDigit =
        isNumberTwoDigits ? int.parse(parsedNumberTime.toString()[0]) : 0;
    final secondDigit = isNumberTwoDigits
        ? int.parse(parsedNumberTime.toString()[1])
        : parsedNumberTime;

    return [
      DigitalNumberWithBG(
        maxHeight: maxHeight,
        value: firstDigit,
      ),
      DigitalNumberWithBG(
        maxHeight: maxHeight,
        value: secondDigit,
      ),
    ];
  }
}

/// BG stands for background
class DigitalNumberWithBG extends StatelessWidget {
  const DigitalNumberWithBG({
    Key key,
    @required this.maxHeight,
    @required this.value,
  }) : super(key: key);

  final double maxHeight;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DigitalNumber(
          value: value,
          height: maxHeight * 0.35,
          color: Colors.black,
        ),
        DigitalNumber(
          value: 8,
          height: maxHeight * 0.35,
          color: Colors.black12,
        ),
      ],
    );
  }
}
