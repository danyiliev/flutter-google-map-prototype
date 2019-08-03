import 'package:flutter/material.dart';
import 'package:wheelio/SearchField.dart';
import 'package:wheelio/StyledButton.dart';

class SearchForm extends StatelessWidget {
  SearchForm({Key key, this.length, this.showFlag, this.show, this.hide}) : super(key: key);
  final double length;
  final bool showFlag;
  final Function show;
  final Function hide;

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
    );
  }
}
