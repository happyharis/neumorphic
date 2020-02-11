import 'package:flutter/material.dart';

class NeuProgressPieBar extends StatelessWidget {
  const NeuProgressPieBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(225, 234, 244, 1),
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
        border: Border.all(
          width: 15,
          color: Theme.of(context).backgroundColor,
        ),
      ),
      child: Center(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(225, 234, 244, 1),
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
              ),
            ],
            border: Border.all(
              width: 15,
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
