import 'package:flutter/material.dart';
import 'package:fryo/src/screens/InfoScreen.dart';
import 'package:fryo/src/services/DialysisInfo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// create markers for map screen
class MarkerService {
  Marker createCenterMarker(DialysisInfo center, BuildContext context) {
    var markerId = center.name;

    return Marker(
      markerId: MarkerId(markerId),
      draggable: false,
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