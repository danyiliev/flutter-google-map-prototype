import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  StyledButton({
    Key key,
    this.title,
    this.color,
    this.fontColor,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final Color color;
  final Color fontColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 300,
      child: FlatButton(
        child: Text(title,
            style: TextStyle(
              color: fontColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            )),
        color: color,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Color(0xFF333333), width: 1)),
      ),
    );
  }
}
