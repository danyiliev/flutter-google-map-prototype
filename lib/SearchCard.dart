import 'package:flutter/material.dart';
import 'package:wheelio/Logo.dart';
import 'package:wheelio/SearchForm.dart';

class SearchCard extends StatefulWidget {
  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  var showFlag = true;
  var length = 127.0;

  void _hide() {
    setState(() {
      length = 25.0;
      showFlag = false;
    });
  }

  void _show() {
    setState(() {
      length = 127.0;
      showFlag = true;
    });
  }

  final BoxDecoration decoration = new BoxDecoration(
    image: DecorationImage(
      image: AssetImage("background2.png"),
      fit: BoxFit.cover,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
              _show();
            }
        },
        child: Container(
          decoration: decoration,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.1),
              child: Column(
                children: <Widget>[
                  Logo(),
                  SizedBox(
                    height: 59,
                  ),
                  SearchForm(
                    length: length,
                    showFlag: showFlag,
                    show: _show,
                    hide: _hide,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
