import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:fryo/src/services/DialysisInfo.dart';
import 'package:fryo/src/services/DialysisPlaceID.dart';
import 'package:fryo/src/services/LocationService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'DialysisInfoService.dart';
import 'MarkerService.dart';

class ApplicationBloc with ChangeNotifier {
  final dialysisInfoService = DialysisInfoService();
  final userLocationService = LocationService();
  final markerService = MarkerService();
  List<Marker> markers = <Marker>[];
  DialysisInfo selectedDialysisCenter;
  Position currLocation;
  List<DialysisIDDescription> dialysisSearchList;
  StreamController<DialysisInfo> selectedDialysisCenterStream = StreamController<DialysisInfo>();
  String mainId;

  ApplicationBloc() {
    setCurrLocation();
  }

  // user current location
  setCurrLocation() async {
    currLocation = await userLocationService.getCurrentLocation();
    notifyListeners();
  }

  // GoogleMaps search results
  searchPlaces(String searchText) async {
    dialysisSearchList = await dialysisInfoService.dialysisSearch(searchText);
    notifyListeners();
  }

  // GoogleMaps selected search result
  setSelectedDialysisCenter(String placeID) async {
    selectedDialysisCenter =
        await dialysisInfoService.getDialysisCenterInfo(placeID);
    selectedDialysisCenterStream.add(
        await dialysisInfoService.getDialysisCenterInfo(placeID)
    );
    dialysisSearchList = null; // get rid of list
    notifyListeners();
  }

  setSelectedCenterMarker(BuildContext buildContext) async {
    if (selectedDialysisCenter != null) {
      markers.clear();
      markers.add(markerService.createCenterMarker(selectedDialysisCenter, buildContext));
    }
  }

  @override
  dispose() {
    selectedDialysisCenterStream.close();
    super.dispose();
  }
}