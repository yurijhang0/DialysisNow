import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fryo/src/services/LocationService.dart';
import 'package:fryo/src/shared/colors.dart';
import 'package:fryo/src/shared/fryo_icons.dart';
import 'package:fryo/src/shared/styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _selectedIndex = 1; // edit later when connecting the screens
  LocationService locationService;
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433); // change to get main dialysis center

  @override
  Widget build(BuildContext context) {
    final locationService = Provider.of<LocationService>(context); // get context from main.dart and notifier
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        title:
        Text('DialysisNow', textAlign: TextAlign.center),
      ),
      body: (locationService.currLocation == null)
        ? Center(
          child: CircularProgressIndicator(), // change to promot user to share their locaiton in settings!!!!!! DO THIS
        )
        : Stack(
          children: <Widget>[
            Container(
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(locationService.currLocation.latitude,
                      locationService.currLocation.longitude),
                    zoom: 14),
              )
            ),
            [Text('Search Feature Currently Unavailable'),
              infoTab(context),
              Text('Resources Feature Currently Unavailable'),
            ][_selectedIndex],
          ]
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Fryo.search),
              title: Text(
                'Search',
                style: tabLinkStyle,
              )),
          BottomNavigationBarItem(
              icon: Icon(Fryo.star),
              title: Text(
                'Main Center',
                style: tabLinkStyle,
              )),
          BottomNavigationBarItem(
              icon: Icon(Fryo.alarm),
              title: Text(
                'Resources',
                style: tabLinkStyle,
              )),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green[600],
        onTap: _onItemTapped,
      ));
  }
  Widget infoTab(BuildContext context) {  // bottom navigation bar ADD IN
    return ListView(children: <Widget>[
      // Image.network(
      //   'https://maps.googleapis.com/' +
      //       'maps/api/place/photo?maxwidth=400&photo_reference=' + snapshot2.data.imageRef +
      //       '&key=AIzaSyBZZvJlR5JkiBo_5mSKYvBFoxFg2noE1VA', height: 150, fit: BoxFit.fitWidth,),
      // mainInfo(),
      // headerTopCategories(context),
      // report(),
      // medicalInfo(),
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
