import 'package:flutter/material.dart';

class LocationPointer extends StatelessWidget {
  LocationPointer({Key key, this.top, this.left, this.size = 24.0, this.onClick = null})
      : super(key: key);

  final double top;
  final double left;
  final double size;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top - size,
      left: left - (size / 4.0),
      child: IconButton(
          icon: Icon(
            Icons.location_on,
            color: Colors.black,
            size: size,
          ),
          onPressed: onClick,
      ),
    );
  }
}
