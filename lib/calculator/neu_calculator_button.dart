import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism_web/calculator/concave_decoration.dart';
import 'package:neumorphism_web/calculator/neumorphic_theme.dart';

class NeuCalculatorButton extends StatefulWidget {
  NeuCalculatorButton({
    Key? key,
    required this.text,
    this.textColor,
    this.textSize,
    this.isPill = false,
    required this.onPressed,
    this.isChosen = false,
  }) : super(key: key);

  final bool isChosen;
  final bool isPill;
  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final double? textSize;

  @override
  _NeuCalculatorButtonState createState() => _NeuCalculatorButtonState();
}

class _NeuCalculatorButtonState extends State<NeuCalculatorButton> {
  bool _isPressed = false;

  @override
  void didUpdateWidget(NeuCalculatorButton oldWidget) {
    if (oldWidget.isChosen != widget.isChosen) {
      setState(() => _isPressed = widget.isChosen);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() => _isPressed = true);
    widget.onPressed();
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _isPressed = widget.isChosen);
  }

  @override
  Widget build(BuildContext context) {
    final brightnessValue = MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;
    final neumorphicTheme =
        isDark ? NeumorphicTheme.dark() : NeumorphicTheme.light();
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

    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        constraints: BoxConstraints(
          minHeight: buttonSize.height,
          minWidth: buttonSize.width,
        ),
        alignment: Alignment(widget.isPill ? -0.6 : 0, 0),
        decoration: _isPressed ? innerShadow : outerShadow,
        child: Text(
          widget.text,
          style: GoogleFonts.montserrat(
            fontSize: widget.textSize ?? 30,
            fontWeight: FontWeight.w200,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ),
    );
  }
}
