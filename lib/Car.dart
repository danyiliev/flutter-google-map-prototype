import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wheelio/CircleButton.dart';

class Car extends StatelessWidget {
  Car({Key key, this.price, this.show}) : super(key: key);
  final double price;
  final bool show;
  final int views = 56;
  final int parked = 12;

  @override
  Widget build(BuildContext context) {
    print(show);
    return Container(
      width: 335.0,
      child: show == false ? null : Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Stack(
            children: <Widget>[
              _image(),
              _detailes(),
              _text(),
            ],
          ),
          _price(),
        ],
      ),
    );
  }

  Widget _text() {
    return Container(
      width: double.infinity,
      height: 72.0,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
            0.1,
            0.5,
            1
          ],
              colors: [
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF),
            Color(0x10FFFFFF)
          ])),
      child: Row(
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
    );
  }

  Widget _detailes() {
    return Positioned(
      width: 335.0,
      top: 188.0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleButton(
              icon: FontAwesomeIcons.trailer,
              text: 'manuel',
            ),
            CircleButton(
              icon: FontAwesomeIcons.trello,
              text: '6.4L V8',
            ),
            CircleButton(
              icon: FontAwesomeIcons.wheelchair,
              text: 'AWD',
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Container(
      margin: EdgeInsets.only(bottom: 70.0),
      child: Image(
        image: AssetImage("car.png"),
      ),
    );
  }

  Widget _price() {
    return Text(
      FlutterMoneyFormatter(amount: price).output.symbolOnLeft,
      style: TextStyle(
        color: Color(0xFF333333),
        fontWeight: FontWeight.bold,
        fontSize: 21.0,
      ),
    );
  }
}
