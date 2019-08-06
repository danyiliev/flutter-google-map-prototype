import 'package:flutter/material.dart';

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
