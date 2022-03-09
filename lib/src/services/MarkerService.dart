import 'package:flutter/material.dart';
import 'package:fryo/src/screens/InfoScreen.dart';
import 'package:fryo/src/services/DialysisInfo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// create markers for map screen
class MarkerService {
  Future<Marker> createCenterMarker(DialysisInfo center, BuildContext context) async {
    var markerId = center.name;

    return Marker(
      markerId: MarkerId(markerId),
      draggable: false,
      // icon: await BitmapDescriptor.fromAssetImage(
      // ImageConfiguration(size: Size(48, 48)),
      // 'assets/CLICK_HERE_2.png'),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return InfoScreen(placeID: center.placeID);
            }));
      },
      position: LatLng(center.lat, center.lng),
    );
  }
}