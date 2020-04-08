import 'package:flutter/material.dart';
import 'package:neumorphism_web/neumorphic_start_page/bottom_left_clipper.dart';
import 'package:neumorphism_web/neumorphic_start_page/bottom_left_clipper_bottom.dart';
import 'package:neumorphism_web/neumorphic_start_page/clip_shadow_path.dart';
import 'package:neumorphism_web/neumorphic_start_page/top_right_cipper_bottom.dart';
import 'package:neumorphism_web/neumorphic_start_page/top_right_clipper.dart';
import 'package:transparent_image/transparent_image.dart';

class NeumorphicStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final boxShadow = BoxShadow(
      color: Colors.grey,
      offset: Offset(-5, 3),
      blurRadius: 5,
      spreadRadius: 10,
    );

    // Neumorphic colored container with 99% app width
    final widthNeuContainer = Container(
      width: width * 0.99,
      color: kNeumorphicColor,
    );

    // Neumorphic colored container with 99% app height
    final heightNeuContainer = Container(
      height: height * 0.99,
      color: kNeumorphicColor,
    );

    return Material(
      child: Stack(
        children: <Widget>[
          Align(
            child: ClipShadowPath(
              shadow: boxShadow,
              clipper: TopRightNeuClipperBtm(),
              child: widthNeuContainer,
            ),
          ),
          Align(
            alignment: Alignment(30, -1),
            child: ClipShadowPath(
              shadow: boxShadow,
              clipper: TopRightNeuClipper(),
              child: widthNeuContainer,
            ),
          ),
          Align(
            alignment: Alignment(0, 30.5),
            child: ClipShadowPath(
              shadow: boxShadow,
              clipper: BottomLeftNeuClipperBtm(),
              child: heightNeuContainer,
            ),
          ),
          Align(
            alignment: Alignment(0, 9),
            child: SizedBox(
              width: width,
              height: height * 0.99,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: kHomeImage,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 80.5),
            child: ClipShadowPath(
              shadow: boxShadow,
              clipper: BottomLeftNeuClipper(),
              child: heightNeuContainer,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'Neumorphic',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 58.0),
              child: SizedBox(
                width: width * 0.8,
                child: MaterialButton(
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: Theme.of(context).textTheme.headline1.color,
                  child: Text(
                    'Let\'s Get Started',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

final kNeumorphicColor = Color.fromRGBO(235, 228, 229, 1); // rgb(235, 228, 229)
final kHomeImage =
    'https://user-images.githubusercontent.com/31005114/78748465-b5327d00-799e-11ea-9f40-38d322a9531a.png';
