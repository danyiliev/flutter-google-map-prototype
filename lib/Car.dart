import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Car extends StatelessWidget {
  Car({Key key, this.price}) : super(key: key);
  final int price;
  final int views = 56;
  final int parked = 12;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.0,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 70.0),
                child: Image(
                  image: AssetImage("car.png"),
                ),
              ),
              Positioned(
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
              ),
              Container(
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
              ),
            ],
          ),
          Text(
            "\$${price.toString()}",
            style: TextStyle(
              color: Color(0xFF333333),
              fontWeight: FontWeight.bold,
              fontSize: 21.0,
            ),
          ),
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  CircleButton({Key key, this.text = 'default', this.icon = Icons.flag})
      : super(key: key);
  final String text;
  final IconData icon;

  Widget _circleIcon(icon) {
    return Container(
      width: 61,
      height: 61,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF333333),
            blurRadius: 0.1,
            offset: Offset(0.1, 0.1),
          )
        ],
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: 30.0,
          color: Color(0xFF333333),
        ),
        onPressed: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      _circleIcon(icon),
      Text(
        text,
        style: TextStyle(fontSize: 12.0),
      ),
    ]);
  }
}
