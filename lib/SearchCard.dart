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
  var submitable = false;
  var mapLoading = false;

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

  void _disable() {
    setState(() {
      submitable = false;
    });
  }

  void _enable() {
    setState(() {
      submitable = true;
    });
  }

  void _load() {
    setState(() {
      mapLoading = true;
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
            resizeToAvoidBottomPadding: false,
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
                    submitable: submitable,
                    loading: mapLoading,
                    show: _show,
                    hide: _hide,
                    enable: _enable,
                    disable: _disable,
                    load: _load,             
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
