import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  BitmapDescriptor smallPin;
  BitmapDescriptor bigPin;

  @override
  void initState() {
    setSourceAndDestinationIcons();
    getCurrentLocation();
    super.initState();
  }

  void setSourceAndDestinationIcons() async {
    BitmapDescriptor small = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 3.5),
      'assets/small_pin.png',
    );
    BitmapDescriptor big = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 3.5),
      'assets/big_pin.png',
    );
    setState(() {
      smallPin = small;
      bigPin = big;
    });
  }

  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    print(res);
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
              child: SpinKitFadingCircle(color: Colors.white, size: 50.0),
            )
          : mapWidget(showFlag, position),
    );
  }

  Widget mapWidget(showFlag, position) {
    return Stack(
      children: <Widget>[
        _googleMap(context, position),
        _zoomIn(),
        _zoomOut(),
        CarDetailedWidget(
          show: showFlag,
        ),
      ],
    );
  }

  Widget _googleMap(context, position) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        onTap: (lat) {
          setState(() {
            showFlag = false;
            index = 0;
          });
        },
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
        markers: _setMarker(),
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
    setState(() {
      index = i;
      showFlag = true;
    });
  }

  Set<Marker> _setMarker() {
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
        icon: index == 1 ? bigPin : smallPin,
        infoWindow: InfoWindow(),
        onTap: () => pick(1),
        draggable: false,
      ),
      //_secondPin,
      Marker(
        markerId: MarkerId('second_pin'),
        position: LatLng(37.790351, -122.406104),
        icon: index == 2 ? bigPin : smallPin,
        infoWindow: InfoWindow(),
        onTap: () => pick(2),
        draggable: false,
      ),
      //_thirdPin,
      Marker(
        markerId: MarkerId('third_pin'),
        position: LatLng(37.788176, -122.405969),
        icon: index == 3 ? bigPin : smallPin,
        infoWindow: InfoWindow(),
        onTap: () => pick(3),
        draggable: false,
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
