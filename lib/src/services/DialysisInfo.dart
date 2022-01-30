/*
Format dialysis information from http get request.
 */
class DialysisInfo {

  final String name;
  final String address;
  final String phoneNum;
  final bool status;
  final List<dynamic> openingHours;
  final String imageRef;
  final String imageURL;


  DialysisInfo({
    this.name,
    this.address,
    this.phoneNum,
    this.status,
    this.openingHours,
    this.imageRef,
    this.imageURL
  });

  factory DialysisInfo.fromJson(Map<String, dynamic> json) {
    return DialysisInfo(
      name: json['result']['name'].toString(),
      address: json['result']['formatted_address'].toString(),
      phoneNum: json['result']['formatted_phone_number'].toString(),
      status: json['result']['opening_hours']['open_now'],
      openingHours: json['result']['opening_hours']['weekday_text'],
      imageRef: json['result']['photos'][0]['photo_reference'].toString()
    );
  }

}