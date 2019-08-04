import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wheelio/LogoCard.dart';
import 'package:wheelio/SearchCard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToSearch() {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => SearchCard(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 2000),
        ));
    //Navigator.pushNamed(context, '/search');
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigateToSearch);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return LogoCard();
  }
}
