import 'package:flutter/material.dart';
import 'package:wheelio/SearchField.dart';

class SearchForm extends StatefulWidget {
  @override
  _SearchFromState createState() => _SearchFromState();
}

class _SearchFromState extends State<SearchForm> {
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

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
              _hide();
              print('ddd');
            }
          },
          child: Column(
            children: <Widget>[
              SearchField(
                label: 'Find your next amazing vehicle!',
                onTap: () {
                  _hide();
                },
                onSubmitted: (v) {
                  _show();
                },
              ),
              SizedBox(height: length),
              StyledButton(
                title: 'SEARCH',
                color: Color(0xFF333333),
                fontColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/googlemap');
                },
              ),
              if (showFlag == true) ...[
                SizedBox(height: 33),
                Text('OR', style: TextStyle(color: Color(0xFF333333))),
                SizedBox(height: 33),
                StyledButton(
                  title: 'POST A CAR FOR SALE',
                  color: null,
                  onPressed: null,
                  fontColor: Color(0xFF333333),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class StyledButton extends StatelessWidget {
  StyledButton(
      {Key key, this.title, this.color, this.fontColor, this.onPressed})
      : super(key: key);

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
                color: fontColor, fontSize: 14, fontWeight: FontWeight.bold)),
        color: color,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Color(0xFF333333), width: 1)),
      ),
    );
  }
}
