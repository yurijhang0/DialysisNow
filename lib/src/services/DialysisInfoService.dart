import 'dart:convert';

import 'package:fryo/src/services/DialysisInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/*
HTTP Get requests for dialysis center information.
 */
class DialysisInfoService {

  static final key = 'AIzaSyBZZvJlR5JkiBo_5mSKYvBFoxFg2noE1VA';

  // make network request
  // Future<List<DialysisInfo>> getDialysisCenterInfo(String id) async {
  //   var url = Uri.parse();
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var json = convert.jsonDecode(response.body);
  //     var jsonResult = json['result'];
  //     return jsonResult.map(DialysisInfo.fromJson(json));
  //   } else {
  //     throw Exception('Failed to retrieve dialysis center information.');
  //   }
  // }

  Future<DialysisInfo> getDialysisCenterInfo(String id) async {
    final response = await http
        .get(Uri.parse('https://maps.googleapis.com/maps/api/place/details/'
        + 'json?key=$key&fields=name%2Cformatted_address%2C' +
        'formatted_phone_number%2Copening_hours&place_id=$id'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return DialysisInfo.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}