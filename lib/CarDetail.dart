import 'package:flutter/material.dart';
import 'package:wheelio/Car.dart';
import 'package:wheelio/SearchField.dart';

class CarDetailedWidget extends StatelessWidget {
  CarDetailedWidget({Key key, this.show}) : super(key: key);
  final bool show;

  final BoxDecoration decoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
          color: Color(0xFF9D9D9D), blurRadius: 20.0, offset: Offset(0.0, 3.0))
    ],
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: show == false ? 20.0 : 42.0,
              bottom: show == false ? 35.0 : 15.0,
            ),
            decoration: decoration,
            child: Column(
              children: <Widget>[
                SearchField(
                  onTap: null,
                  onSubmitted: null,
                ),
                if (show != false)
                  Car(
                    price: 198322,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
