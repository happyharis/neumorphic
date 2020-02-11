import 'package:flutter/material.dart';

class NeuHamburgerButton extends StatelessWidget {
  const NeuHamburgerButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer(
      color: Color.fromRGBO(227, 237, 247, 1),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (var i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.5),
                child: Container(
                  height: 1.3,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(1),
                    ),
                    boxShadow: [
                      // Edge shadow
                      BoxShadow(
                        offset: Offset(-1, -1),
                        color: Color.fromRGBO(176, 193, 209, 1),
                        spreadRadius: 1.0,
                      ),
                      // Circular shadow
                      BoxShadow(
                        color: Colors.white,
                        // spreadRadius: 0.5,
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;
  final EdgeInsets padding;

  NeumorphicContainer({
    Key key,
    this.child,
    this.bevel = 10.0,
    this.color,
    this.padding = const EdgeInsets.all(16.0),
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
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
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: widget.padding,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(227, 237, 247, 1),
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    blurRadius: 15,
                    offset: -widget.blurOffset,
                    color: Colors.white,
                  ),
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(10.5, 10.5),
                    color: Color.fromRGBO(214, 223, 230, 1),
                  )
                ],
        ),
        child: widget.child,
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
