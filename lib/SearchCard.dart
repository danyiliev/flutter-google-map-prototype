import 'package:flutter/material.dart';
import 'package:wheelio/Logo.dart';
import 'package:wheelio/SearchForm.dart';

class SearchCard extends StatelessWidget {
  final BoxDecoration decoration = new BoxDecoration(
    image: DecorationImage(
      image: AssetImage("background2.png"),
      fit: BoxFit.cover,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: decoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.1),
            child: Column(
              children: <Widget>[
                Logo(),
                SizedBox(
                  height: 59,
                ),
                SearchForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
