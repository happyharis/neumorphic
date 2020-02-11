import 'package:flutter/material.dart';

import 'digital_font/digital_number.dart';

class NeuDigitalClock extends StatelessWidget {
  const NeuDigitalClock({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Outer white container
    return Container(
      height: 145,
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 230, 243, 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: Offset(-5, -5),
            color: Colors.white,
          ),
          BoxShadow(
            blurRadius: 15,
            offset: Offset(10.5, 10.5),
            color: Color.fromRGBO(214, 223, 230, 1),
          )
        ],
      ),
      // Digital green background
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            height: constraints.maxHeight * 0.87,
            width: constraints.maxWidth * 0.95,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(203, 211, 196, 1),
                Color.fromRGBO(176, 188, 163, 1)
              ]),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color.fromRGBO(168, 168, 168, 1),
                width: 2,
              ),
            ),
            child: DigitalClock(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              hours: 11,
            ),
          ),
        ),
      ),
    );
  }
}

class DigitalClock extends StatelessWidget {
  const DigitalClock({
    Key key,
    @required this.height,
    @required this.width,
    this.hours,
    this.minutes,
    this.seconds,
  }) : super(key: key);

  final num height;
  final num width;
  final int hours;
  final int minutes;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    final isHourTwoDigits = hours.toString().length == 2;
    final firstDigit = int.parse(hours.toString()[0]);
    final tenthHour = isHourTwoDigits ? firstDigit : 0;
    final hour = isHourTwoDigits ? int.parse(hours.toString()[1]) : firstDigit;

    final hourNumber = [
      DigitalNumberWithBG(
        height: height * 0.35,
        value: tenthHour,
      ),
      DigitalNumberWithBG(
        height: height * 0.35,
        value: hour,
      ),
    ];
    return Center(
      child: Container(
        // color: Colors.green,
        height: height * 0.47,
        width: width * 0.70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [...hourNumber],
        ),
      ),
    );
  }
}

class DigitalNumberWithBG extends StatelessWidget {
  const DigitalNumberWithBG({
    Key key,
    this.value = 0,
    this.padLeft,
    this.height,
    this.color,
    this.backgroundValue = 8,
  }) : super(key: key);

  final int value;
  final int backgroundValue;
  final int padLeft;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Foreground
        DigitalNumber(
          value: value,
          color: Colors.black,
          height: height,
        ),

        // Background
        DigitalNumber(
          value: backgroundValue,
          color: Colors.black12,
          height: height,
        ),
      ],
    );
  }
}
