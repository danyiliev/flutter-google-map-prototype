import 'package:flutter/material.dart';
import 'package:wheelio/SearchField.dart';
import 'package:wheelio/StyledButton.dart';

class SearchForm extends StatelessWidget {
  SearchForm({
    Key key,
    this.length,
    this.showFlag,
    this.show,
    this.hide,
    this.disable,
    this.enable,
    this.submitable,
  }) : super(key: key);
  
  final double length;
  final bool showFlag;
  final bool submitable;
  final Function show;
  final Function hide;
  final Function disable;
  final Function enable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchField(
          label: 'Find your next amazing vehicle!',
          onTap: () {
            hide();
          },
          onSubmitted: (v) {
            show();
          },
          onChange: (v) {
            if (v.toString().length > 0) {
              enable();
            } else {
              disable();
            }
          },
        ),
        SizedBox(height: length),
        StyledButton(
          title: 'SEARCH',
          color: Color(0xFF333333),
          fontColor: Colors.white,
          onPressed: () {
            print(submitable);
            if (submitable == true) {
              Navigator.pushNamed(context, '/googlemap');
            }
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
    );
  }
}
