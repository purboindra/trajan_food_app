class RestoModel {
  final String name;
  final String addres;
  final double rating;

  RestoModel({
    required this.name,
    required this.addres,
    required this.rating,
  });

  factory RestoModel.fromJson(Map<String, dynamic> json) {
    return RestoModel(
        name: json["name"], addres: json["address"], rating: json["rating"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": addres,
      "rating": rating,
    };
  }
}
