import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism_web/neumorphic_bar.dart';
import 'package:neumorphism_web/neumorphic_pie/neumorphic_pie.dart';

import 'package:neumorphism_web/timer/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphic Widgets',
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(231, 240, 247, 1),
        scaffoldBackgroundColor: Color.fromRGBO(231, 240, 247, 1),
        textTheme: TextTheme(
          headline4: GoogleFonts.dMSans(
            textStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(49, 68, 105, 1),
            ),
          ),
        ),
      ),
      home: TimerScreen(),
      // home: GradientArcPainterDemo(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BarDays(),
          SizedBox(height: 40),
          NeumorphicPie(),
        ],
      ),
    );
  }
}

class BarDays extends StatelessWidget {
  const BarDays({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        NeumorphicBar(
          width: 200,
          height: 400,
          value: 0.5,
          text: 'Mon',
        ),
        NeumorphicBar(
          width: 200,
          height: 400,
          value: 0.9,
          text: 'Tue',
          color: Color.fromRGBO(0, 200, 156, 1),
        ),
        NeumorphicBar(
          width: 200,
          height: 400,
          value: 0.7,
          text: 'Wed',
        ),
        NeumorphicBar(
          width: 200,
          height: 400,
          value: 1,
          text: 'Thur',
        ),
      ],
    );
  }
}
