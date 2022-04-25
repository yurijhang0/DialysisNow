import 'dart:developer';

/*
Format dialysis information from http get request.
 */
class DialysisInfo {

  final String placeID;
  final String name;
  final String address;
  final String phoneNum;
  final bool status;
  final List<dynamic> openingHours;
  final String imageRef;
  final double lat;
  final double lng;


  DialysisInfo({
    this.placeID,
    this.name,
    this.address,
    this.phoneNum,
    this.status,
    this.openingHours,
    this.imageRef,
    this.lat,
    this.lng
  });

  factory DialysisInfo.fromJson(Map<String, dynamic> json) {
    return DialysisInfo(
      placeID: json['result']['place_id'].toString(),
      name: json['result']['name'].toString(),
      address: json['result']['formatted_address'].toString(),
      phoneNum: json['result']['formatted_phone_number'].toString(),
      status: json['result']['opening_hours']['open_now'],
      openingHours: json['result']['opening_hours']['weekday_text'],
      imageRef: json['result']['photos'][0]['photo_reference'].toString(),
      lat: json['result']['geometry']['location']['lat'],
      lng: json['result']['geometry']['location']['lng']
    );
  }

}