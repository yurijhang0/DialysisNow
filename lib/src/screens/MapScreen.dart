import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fryo/src/shared/colors.dart';
import 'package:fryo/src/shared/fryo_icons.dart';
import 'package:fryo/src/shared/styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _selectedIndex = 1; // edit later when connecting the screens

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  // method called upon map creation
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title:
          Text('DialysisNow', textAlign: TextAlign.center),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              // starting camera position when map is loaded ** FIX TO START AT MAIN CENTER
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
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
