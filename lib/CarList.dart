import 'package:flutter/material.dart';
import 'package:wheelio/CarDetail.dart';
import 'package:wheelio/LocationPointer.dart';

class CarList extends StatefulWidget {
  @override
  _CarListState createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  bool flag = false;
  int index = 0;

  void onClick(i) {
    setState(() {
      index = i;
      flag = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        LocationPointer(
          top: 220.0,
          left: 15.0,
          onClick: () => onClick(1),
          size: index == 1 ? 48.0 : 24.0,
        ),
        LocationPointer(
          top: 535.22,
          left: 111.0,
          onClick: () => onClick(2),
          size: index == 2 ? 40.0 : 24.0,
        ),
        LocationPointer(
          top: 621.22,
          left: 220.0,
          onClick: () => onClick(3),
          size: index == 3 ? 48.0 : 24.0,
        ),
        //CarDetailedWidget(show: flag),
      ],
    );
  }
}
