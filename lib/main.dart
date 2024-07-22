import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism_web/calculator/calculator_logic.dart';
import 'package:neumorphism_web/calculator/calculator_view.dart';
import 'package:neumorphism_web/calculator/neumorphic_theme.dart';
import 'package:neumorphism_web/neumorphic_bar/neumorphic_bar.dart';
import 'package:neumorphism_web/neumorphic_pie/neumorphic_pie.dart';
import 'package:neumorphism_web/timer/screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<Calculator>(
    create: (_) => Calculator(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic Widgets',
      theme: ThemeData(
        canvasColor: kBackgroundColour,
        scaffoldBackgroundColor: kScaffoldBackgroundColour,
        textTheme: GoogleFonts.dmSansTextTheme(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: kDarkBackgroundColour,
      ),
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Neumorphic Widgets'),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            body: Column(
              children: [
                ListTile(
                    leading: Icon(Icons.calculate),
                    title: Text('Calcualtor'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalculatorView()))),
                ListTile(
                    leading: Icon(Icons.timer),
                    title: Text('Timer'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimerScreen()))),
                ListTile(
                    leading: Icon(Icons.pie_chart),
                    title: Text('Pie and chart'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()))),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

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
    Key? key,
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
