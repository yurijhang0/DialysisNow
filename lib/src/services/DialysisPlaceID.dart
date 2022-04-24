class DialysisIDDescription {
  final String placeId;
  final String name;

  DialysisIDDescription({
    this.placeId,
    this.name
  });

  factory DialysisIDDescription.fromJson(Map<String, dynamic> json) {
    return DialysisIDDescription(
      placeId: json['place_id'],
      name: json['name'],
      //description: json['description']
    );
  }
}