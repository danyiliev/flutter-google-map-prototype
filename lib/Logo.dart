import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  final String title = 'Wheelio';
  final String description = 'A REVOLUTION IN TRANSPORTATION ACQUISITION';
  final Color logoCaptionColor = Color(0xFF333333);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 262.89,
        ),
        Text(
          title,
          textDirection: TextDirection.ltr,
          style: GoogleFonts.lato(
            fontSize: 58,
            fontWeight: FontWeight.w900,
            color: logoCaptionColor,
          ),
        ),
        Text(
          description,
          textDirection: TextDirection.ltr,
          style: GoogleFonts.lato(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: logoCaptionColor,
          ),
        ),
      ],
    );
  }
}
