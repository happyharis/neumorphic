import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism_web/timer/neu_hamburger_button.dart';
import 'package:neumorphism_web/timer/neu_reset_button.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            SizedBox(height: 20),
            TimerTitle(),
            SizedBox(height: 60),
            Container(
              height: 145,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Container(
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 25),
            NeuResetButton(),
          ],
        ),
      ),
    );
  }
}

class TimerTitle extends StatelessWidget {
  const TimerTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Timer',
          style: Theme.of(context).textTheme.headline1,
        ),
        Spacer(),
        NeuHamburgerButton()
      ],
    );
  }
}
