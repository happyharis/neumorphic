import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism_web/calculator/concave_decoration.dart';
import 'package:neumorphism_web/calculator/neumorphic_theme.dart';
import 'package:provider/provider.dart';

class NeuCalculatorButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final bool isPill;

  NeuCalculatorButton({
    Key key,
    @required this.text,
    this.textColor,
    this.textSize,
    this.isPill = false,
  }) : super(key: key);

  @override
  _NeuCalculatorButtonState createState() => _NeuCalculatorButtonState();
}

class _NeuCalculatorButtonState extends State<NeuCalculatorButton> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() => _isPressed = true);
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final neumorphicTheme = Provider.of<NeumorphicTheme>(context);
    final width = MediaQuery.of(context).size.width;
    final squareSideLength = width / 5;
    final buttonWidth = squareSideLength * (widget.isPill ? 2.2 : 1);
    final buttonSize = Size(buttonWidth, squareSideLength);

    final innerShadow = ConcaveDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonSize.width),
      ),
      colors: neumorphicTheme.innerShadowColors,
      depression: 10,
    );

    final outerShadow = BoxDecoration(
      border: Border.all(color: neumorphicTheme.borderColor),
      borderRadius: BorderRadius.circular(buttonSize.width),
      color: neumorphicTheme.buttonColor,
      boxShadow: neumorphicTheme.outerShadow,
    );

    return SizedBox(
      height: buttonSize.height,
      width: buttonSize.width,
      child: Listener(
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              padding: EdgeInsets.all(width / 12),
              decoration: _isPressed ? innerShadow : outerShadow,
            ),
            Align(
              alignment: Alignment(widget.isPill ? -0.6 : 0, 0),
              child: Text(
                widget.text,
                style: GoogleFonts.montserrat(
                  fontSize: widget.textSize ?? 30,
                  fontWeight: FontWeight.w200,
                  color: widget.textColor ??
                      Theme.of(context).textTheme.bodyText1.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
