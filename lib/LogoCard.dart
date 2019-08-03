import 'package:flutter/material.dart';
import 'Logo.dart';

class LogoCard extends StatelessWidget {
  final Color backgroundColor = Color(0xFFF0F0F0);

  final BoxDecoration decoration = new BoxDecoration(
    gradient: new RadialGradient(colors: [
      Color(0xFFFFFFFF),
      Color(0xFFE0E0E0E0),
    ]),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: decoration,
        child: Logo(),
      ),
    );
  }
}
