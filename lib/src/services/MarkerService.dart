import 'package:flutter/material.dart';
import 'package:fryo/src/screens/InfoScreen.dart';
import 'package:fryo/src/services/DialysisInfo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;
import 'dart:typed_data';

// create markers for map screen
class MarkerService {
  static Uint8List markerIcon;

  static Future<Uint8List> getBytesFromAsset({String path,int width})async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(),
        targetWidth: width
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(
        format: ui.ImageByteFormat.png))
        .buffer.asUint8List();
  }

  static void getMarker() async {
    markerIcon = await getBytesFromAsset(
        path: 'images/click.bmp', //paste the custom image path
        width: 300 // size of custom image as marker
    );
  }

  Marker createCenterMarker(DialysisInfo center, BuildContext context) {
    var markerId = center.name;

    return Marker(
      markerId: MarkerId(markerId),
      icon: BitmapDescriptor.fromBytes(markerIcon),
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