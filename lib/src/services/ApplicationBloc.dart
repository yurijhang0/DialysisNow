import 'package:flutter/cupertino.dart';
import 'package:fryo/src/services/DialysisPlaceID.dart';
import 'package:fryo/src/services/DialysisPlaceIDService.dart';
import 'package:fryo/src/services/UserLocationService.dart';
import 'package:geolocator/geolocator.dart';

class ApplicationBloc with ChangeNotifier {
  final dialysisSearchService = DialysisSearchService();
  final userLocationService = UserLocationService();

  Position currLocation;
  List<DialysisIDDescription> dialysisSearchList;

  ApplicationBloc() {
    setCurrLocation();
  }

  setCurrLocation() async {
    currLocation = await userLocationService.getCurrentLocation();
    notifyListeners();
  }

  searchPlaces(String searchText) async {
    dialysisSearchList = await dialysisSearchService.dialysisSearch(searchText);
    notifyListeners();
  }
}