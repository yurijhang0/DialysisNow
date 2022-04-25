library my_prj.globals;
import 'package:flutter/cupertino.dart';
import 'package:fryo/src/screens/MainInfoScreen.dart';
import 'package:fryo/src/screens/MapScreen.dart';
import 'package:fryo/src/screens/Resources.dart';

String mainID = 'ChIJuc46ohEE9YgRyY2WKddJ4OY';
List<Widget> widgetOptions = <Widget>[
  MapScreen(),
  MainInfoScreen(placeID: mainID),
  Resources(),
];
List<Map<String, dynamic>> reportList = [];