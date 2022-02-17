import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fryo/src/services/ApplicationBloc.dart';
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
  ApplicationBloc applicationBloc;

  @override
  Widget build(BuildContext context) {
    applicationBloc = Provider.of<ApplicationBloc>(context); // get context from main.dart and notifier
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        title:
        Text('DialysisNow', textAlign: TextAlign.center),
      ),
      body: (applicationBloc.currLocation == null)
        ? Center(
          child: CircularProgressIndicator(), // change to promote user to share their locaiton in settings!!!!!! DO THIS
        )
        : Stack(
          children: [
            Column(
              children: [
              TextField(
                onChanged: (value) => applicationBloc.searchPlaces(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter additional information',
                ),
              ),
              Flexible(
                // height: MediaQuery.of(context).size.height - 196.0, // hardcoded this but is there a way to get navbar height?????
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(applicationBloc.currLocation.latitude,
                          applicationBloc.currLocation.longitude),
                      zoom: 14),
                )
              ),
                if (applicationBloc.dialysisSearchList != null &&
                    applicationBloc.dialysisSearchList.length != 0)
                  Container(
                    height: 300.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                if (applicationBloc.dialysisSearchList != null &&
                    applicationBloc.dialysisSearchList.length != 0)
                  Container(
                      height: 300.0,
                      child: ListView.builder(
                          itemCount: applicationBloc.dialysisSearchList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(
                                    applicationBloc.dialysisSearchList[index].description,
                                    style: TextStyle(color: Colors.blue)
                                )
                            );
                          }
                      )
                  )
            ]
          )]
        ),
        bottomNavigationBar:  BottomNavigationBar(
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
        )
    );
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
