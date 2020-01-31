import 'package:flutter/material.dart';
import 'package:neumorphism_web/neumorphic_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphic Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
      body: Row(
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
      ),
    );
  }
}
