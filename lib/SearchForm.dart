import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wheelio/GoogleMapCard.dart';
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
    this.load,
    this.loading,
    this.submitable,
  }) : super(key: key);

  final double length;
  final bool showFlag;
  final bool submitable;
  final bool loading;
  final Function show;
  final Function hide;
  final Function disable;
  final Function enable;
  final Function load;

  @override
  Widget build(BuildContext context) {
    void navigateToGoogleMap() {
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => GoogleMapCard(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 2000),
          ));
    }

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
            if (submitable == true) {
              load();
              navigateToGoogleMap();
            }
          },
        ),
        if (loading)
          SizedBox(height: 20.0,),
        if (loading)
          SpinKitFadingCircle(color: Colors.white, size: 50.0),
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
