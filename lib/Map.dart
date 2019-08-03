import 'package:flutter/material.dart';
import 'package:wheelio/CarList.dart';

class Map extends StatelessWidget {
  final BoxDecoration decoration = BoxDecoration(
      image: DecorationImage(image: AssetImage("map.png"), fit: BoxFit.cover));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: decoration,
        child: CarList(),
      ),
    );
  }
}