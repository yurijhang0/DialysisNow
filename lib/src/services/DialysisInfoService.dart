import 'dart:convert';
import 'package:fryo/src/services/DialysisInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer';

import 'DialysisPlaceID.dart';


/*
HTTP Get requests for dialysis center information and for GoogleMaps.
 */
class DialysisInfoService {

  static final key = 'AIzaSyBgKQvmYT0H1PfL3oLHNl2Ge58TFyxZESk';

  // get selected dialysis center information for info screen
  Future<DialysisInfo> getDialysisCenterInfo(String id) async {
    var response = await http.get(Uri.parse('https://maps.googleapis.com/maps' +
        '/api/place/details/json?key=$key&fields=place_id%2Cname%2Cformatted_address%2C' +
        'photos%2Cformatted_phone_number%2Copening_hours%2Cgeometry' +
            '%2Cgeometry&place_id=$id'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log("HI");
      log(response.body);
      return DialysisInfo.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      log("BYE");
      throw Exception('Failed to load dialysis center info.');
    }
  }

  // get GoogleMaps search results for list view in map screen
  Future<List<DialysisIDDescription>> dialysisSearch(String searchText) async {
    var input = searchText.replaceAll(' ', '%');
    var response = await http.get(Uri.parse('https://maps.googleapis.com/maps/'
        //+ 'api/place/textsearch/json?key=$key&query=Dialysis%20center%20in%20$input'));
        + 'api/place/textsearch/json?key=$key&query=Dialysis%20$input'));
        //+ 'api/place/autocomplete/json?key=$key&input=Dialysis%Center%near$input&components=country:us'));
        //+ 'api/place/autocomplete/json?key=$key&input=$input'));
        //+ 'api/place/queryautocomplete/json?key=$key&fields=place_id&input=$input'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var resultList = convert.jsonDecode(response.body)['results'] as List;
      return resultList.map((placeID) =>
          DialysisIDDescription.fromJson(placeID)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load dialysis center info.');
    }
  }
}