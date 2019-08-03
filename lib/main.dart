import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:wheelio/GoogleMapCard.dart';
import 'package:wheelio/SplashScreen.dart';
import 'package:wheelio/SearchCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    FlutterStatusbarcolor.setStatusBarColor(Color(0xFFF0F0F0));

    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/search': (context) => SearchCard(),
        '/googlemap': (context) => GoogleMapCard(),
      },
    );
  }
}