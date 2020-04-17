import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism_web/calculator/neu_calculator_button.dart';

class CalculatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(239, 238, 238, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Spacer(),
            Text(
              '3670',
              style: GoogleFonts.montserrat(
                fontSize: 100,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(height: 150),
            ButtonRow(children: [
              NeuCalculatorButton(text: 'AC'),
              NeuCalculatorButton(text: '+/-'),
              NeuCalculatorButton(text: '%'),
              NeuCalculatorButton(
                text: '÷',
                textColor: kOrange,
                textSize: 45,
              ),
            ]),
            ButtonRow(
              children: [
                NeuCalculatorButton(text: '7'),
                NeuCalculatorButton(text: '8'),
                NeuCalculatorButton(text: '9'),
                NeuCalculatorButton(
                  text: 'x',
                  textColor: kOrange,
                ),
              ],
            ),
            ButtonRow(
              children: [
                NeuCalculatorButton(text: '4'),
                NeuCalculatorButton(text: '5'),
                NeuCalculatorButton(text: '6'),
                NeuCalculatorButton(
                  text: '-',
                  textColor: kOrange,
                  textSize: 50,
                ),
              ],
            ),
            ButtonRow(
              children: [
                NeuCalculatorButton(text: '1'),
                NeuCalculatorButton(text: '2'),
                NeuCalculatorButton(text: '3'),
                NeuCalculatorButton(
                  text: '+',
                  textColor: kOrange,
                  textSize: 45,
                ),
              ],
            ),
            ButtonRow(
              children: [
                NeuCalculatorButton(
                  text: '0',
                  isPill: true,
                ),
                NeuCalculatorButton(text: '.'),
                NeuCalculatorButton(
                  text: '=',
                  textColor: kOrange,
                  textSize: 45,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<NeuCalculatorButton> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}

final kOrange = Color.fromRGBO(238, 134, 48, 1); // rgb(238, 134, 48)
final kDarkShadow = Color.fromRGBO(216, 213, 208, 1); // rgb(216, 213, 208)
