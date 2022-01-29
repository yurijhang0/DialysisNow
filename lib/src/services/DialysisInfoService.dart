import 'dart:convert';

import 'package:fryo/src/services/DialysisInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer';


/*
HTTP Get requests for dialysis cenformation.
 */
class DialysisInfoService {

  static final key = 'AIzaSyBZZvJlR5JkiBo_5mSKYvBFoxFg2noE1VA';

  Future<DialysisInfo> getDialysisCenterInfo(String id) async {
    var response = await http.get(Uri.parse('https://maps.googleapis.com/maps' +
        '/api/place/details/json?key=$key&fields=name%2Cformatted_address%2C' +
        'photos%2Cformatted_phone_number%2Copening_hours&place_id=$id'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var result = jsonDecode(response.body);
      var resultImage = result['result']['photos'][0]['photo_reference'];
      response = await http.get(Uri.parse('https://maps.googleapis.com/' +
          'maps/api/place/photo?maxwidth=400&photo_reference=$resultImage' +
          '&key=$key'));
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return DialysisInfo.fromJson(result);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load dialysis center info.');
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load dialysis center info.');
    }
  }

  Future<String> getDialysisCenterImage(String photoReference) async {
    var response = await http.get(Uri.parse('https://maps.googleapis.com/' +
        'maps/api/place/photo?maxwidth=400&photo_reference=$photoReference' +
        '&key=$key'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load dialysis center info.');
    }
  }
}