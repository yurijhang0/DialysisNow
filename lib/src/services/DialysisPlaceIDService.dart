import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'DialysisPlaceID.dart';

class DialysisSearchService {

  final key = "AIzaSyBZZvJlR5JkiBo_5mSKYvBFoxFg2noE1VA";

  Future<List<DialysisIDDescription>> dialysisSearch(String searchText) async {
    var input = searchText.replaceAll(' ', '%');
    var response = await http.get(Uri.parse('https://maps.googleapis.com/maps/'
        + 'api/place/autocomplete/json?key=$key&input=$input'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var resultList = convert.jsonDecode(response.body)['predictions'] as List;
      return resultList.map((placeID) =>
          DialysisIDDescription.fromJson(placeID)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load dialysis center info.');
    }
  }

}

