import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({Key key, this.onTap = null, this.onSubmitted = null, this.label})
      : super(key: key);
  final Function onTap;
  final Function onSubmitted;
  final String label;
  final Color fontColor = Color(0xFF9D9D9D);

  final BoxDecoration decoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
          color: Color(0xFF9D9D9D), blurRadius: 20.0, offset: Offset(0.0, 3.0))
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      decoration: decoration,
      child: TextField(
        enabled: false,
        autofocus: false,
        onTap: onTap,
        onSubmitted: onSubmitted,
        cursorColor: fontColor,
        style: TextStyle(color: fontColor, fontSize: 16),
        cursorRadius: Radius.elliptical(5, 2),
        decoration: InputDecoration(
          // Background Style
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(top: 10, bottom: 10),

          // Search Prefix Style
          prefixIcon: Icon(
            Icons.search,
            color: fontColor,
          ),
          hintStyle: TextStyle(color: fontColor),
          hintText: label,

          // Border Style          
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
