/*
Format dialysis information from http get request.
 */
class DialysisInfo {

  final String name;
  final String address;
  final String phoneNum;
  final String openingHours;


  DialysisInfo({
    this.name,
    this.address,
    this.phoneNum,
    this.openingHours,
  });

  factory DialysisInfo.fromJson(Map<String, dynamic> json) {
    return DialysisInfo(
      name: json['result']['name'].toString(),
      address: json['result']['formatted_address'].toString(),
      phoneNum: json['result']['formatted_phone_number'].toString(),
      openingHours: json['result']['opening_hours'].toString()
    );
  }

}