import 'package:flutter/material.dart';

class Car extends StatelessWidget {
  final int views = 56;
  final int parked = 12;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.0,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "${views.toString()} views",
              ),
              Text(
                "Parked ${parked.toString()} times",
              ),
            ],
          ),
          Image(image: AssetImage("car.png")),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleButton(),
                CircleButton(),
                CircleButton(),
              ],
            ),
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 61,
      height: 61,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          Icons.keyboard,
          size: 30.0,
          color: Colors.black,
        ),
        onPressed: null,
      ),
    );
  }
}
