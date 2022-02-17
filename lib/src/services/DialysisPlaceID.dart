class DialysisIDDescription {
  final String placeId;
  final String description;

  DialysisIDDescription({
    this.placeId,
    this.description
  });

  factory DialysisIDDescription.fromJson(Map<String, dynamic> json) {
    return DialysisIDDescription(
      placeId: json['place_id'],
      description: json['description']
    );
  }
}