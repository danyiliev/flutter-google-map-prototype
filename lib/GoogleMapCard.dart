import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
import 'package:wheelio/CarDetail.dart';

class GoogleMapCard extends StatefulWidget {
  @override
  _GoogleMapState createState() => _GoogleMapState();
}

const double CAMERA_BEARING = 30.0;

class _GoogleMapState extends State<GoogleMapCard> {
  double zoomValue = 16.0;
  Completer<GoogleMapController> _controller = Completer();
  Position position;

  int index = 0;
  bool showFlag = false;
  bool loading = true;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
      position = res;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : mapWidget(showFlag),
    );
  }

  Widget mapWidget(showFlag) {
    print(showFlag);
    return Stack(
      children: <Widget>[
        _googleMap(context),
        _zoomIn(),
        _zoomOut(),
        CarDetailedWidget(
          show: showFlag,
        ),
      ],
    );
  }

  Widget _googleMap(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        onTap: (lat) {
          setState(() {
            showFlag = false;
          });
        },
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
        markers: _currentLocation(),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          zoom: zoomValue,
          bearing: CAMERA_BEARING,
          target: LatLng(
            position.latitude,
            position.longitude,
          ),
        ),
      ),
    );
  }

  void pick(i) {
    print(i);
    setState(() {
      index = i;
      showFlag = true;
    });
  }

  Set<Marker> _currentLocation() {
    return <Marker>[
      Marker(
        markerId: MarkerId("home"),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(),
      ),
      //_firstPin,
      Marker(
        markerId: MarkerId('first_pin'),
        position: LatLng(37.790650, -122.405591),
        icon: BitmapDescriptor.defaultMarkerWithHue(160.0),
        infoWindow: InfoWindow(),
        onTap: () => pick(1),
      ),
      //_secondPin,
      Marker(
        markerId: MarkerId('second_pin'),
        position: LatLng(37.790351, -122.406104),
        icon: BitmapDescriptor.defaultMarkerWithHue(160.0),
        infoWindow: InfoWindow(),
        onTap: () => pick(2),
      ),
      //_thirdPin,
      Marker(
        markerId: MarkerId('third_pin'),
        position: LatLng(37.788176, -122.405969),
        icon: BitmapDescriptor.defaultMarkerWithHue(160.0),
        infoWindow: InfoWindow(),
        onTap: () => pick(3),
      ),
    ].toSet();
  }

  Widget _zoomOut() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: Icon(FontAwesomeIcons.searchPlus, color: Colors.black),
        onPressed: () {
          setState(() {
            zoomValue--;
          });
        },
      ),
    );
  }

  Widget _zoomIn() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: Icon(FontAwesomeIcons.searchPlus, color: Colors.black),
        onPressed: () {
          setState(() {
            zoomValue++;
          });
        },
      ),
    );
  }
}
