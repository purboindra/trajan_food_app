class LocationModel {
  final String longitude;
  final String latitude;
  final String address;

  LocationModel(
      {required this.address, required this.latitude, required this.longitude});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        address: json['address'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }

  Map<String, dynamic> toJson() {
    return {'address': address, 'latitude': latitude, 'longitude': longitude};
  }
}
