import 'package:flutter/material.dart';

class NeumorphicBar extends StatelessWidget {
  const NeumorphicBar({
    Key key,
    @required this.width,
    @required this.height,
    @required this.value,
    @required this.text,
    this.color,
  }) : super(key: key);

  final num width;
  final num height;

  /// Value from 1.0 to 0.0
  final num value;

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final innerContainerWidth = width * 0.95;
    final innerContainerHeight = height * value * 0.96;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: height * 1.01,
          width: width.toDouble() / 4,
          child: Stack(
            children: <Widget>[
              DugContainer(
                width: width,
                height: height,
              ),
              InnerContainer(
                  width: innerContainerWidth,
                  height: innerContainerHeight,
                  color: color),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            color: Colors.blueGrey[300],
          ),
        ),
      ],
    );
  }
}

class InnerContainer extends StatelessWidget {
  const InnerContainer({
    Key key,
    @required this.height,
    @required this.width,
    this.color,
  }) : super(key: key);

  final num height;
  final num width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Container(
          height: height * 600 / 896,
          width: width * 85 / 414,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(95.0),
            color: color ?? Color.fromRGBO(235, 233, 232, 1),
            boxShadow: [
              BoxShadow(
                offset: Offset(1.5, 1.5),
                color: Colors.black38,
                blurRadius: 2,
              ),
              BoxShadow(
                offset: Offset(-1.5, -1.5),
                color:
                    color?.withOpacity(0.95) ?? Colors.white.withOpacity(0.85),
                blurRadius: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DugContainer extends StatelessWidget {
  const DugContainer({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);
  final num height;
  final num width;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height * 600 / 896,
        width: width * 100 / 414,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: exteriorShadow,
              offset: Offset(0.0, 0.0),
            ),
            BoxShadow(
              color: interiorShadow,
              offset: Offset(0.0, 0.0),
              spreadRadius: -1.0,
              blurRadius: 11.0,
            ),
          ],
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
    );
  }
}

const exteriorShadow = Color.fromRGBO(209, 207, 205, 1);
const interiorShadow = Color.fromRGBO(224, 221, 217, 1);
const backgroundColor = Color.fromRGBO(235, 235, 234, 1);
