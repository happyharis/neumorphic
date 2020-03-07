import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism_web/timer/neu_hamburger_button.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(231, 240, 247, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).viewPadding.top + 20),
            Row(
              children: <Widget>[
                Text(
                  'Timer',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 43,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(49, 68, 105, 1),
                    ),
                  ),
                ),
                Spacer(),
                NeuHamburgerButton()
              ],
            ),
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
            ResetButton(),
          ],
        ),
      ),
    );
  }
}

class HamburgerButton extends StatelessWidget {
  const HamburgerButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
    );
  }
}

class ResetButton extends StatefulWidget {
  const ResetButton({
    Key key,
  }) : super(key: key);

  @override
  _ResetButtonState createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).backgroundColor;
    final bevel = 10.0;
    final blurOffset = Offset(5, 5);
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        height: 73,
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color.fromRGBO(231, 240, 247, 1),
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    blurRadius: bevel,
                    offset: -blurOffset,
                    color: Colors.white,
                  ),
                  BoxShadow(
                    blurRadius: bevel,
                    offset: Offset(10.5, 10.5),
                    color: Color.fromRGBO(214, 223, 230, 1),
                  )
                ],
        ),
        child: Center(
          child: Text(
            'Reset',
            style: GoogleFonts.dMSans(
              textStyle: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(49, 68, 105, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
