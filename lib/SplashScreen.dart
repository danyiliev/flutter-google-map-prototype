import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wheelio/LogoCard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void navigateToSearch() {
    Navigator.pushNamed(context, '/search');
  }

  startTime() async {
    var _duration = new Duration(seconds: 6);
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