import 'package:trajan_food_app/features/models/location_model.dart';

class UserModel {
  final String id;
  final String userName;
  final String email;
  final String password;
  final LocationModel location;
  final List<dynamic> productFavorite;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.location,
    required this.productFavorite,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        userName: json['userName'],
        email: json['email'],
        password: json['password'],
        location: json['location'],
        productFavorite: json['productFavorite']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'password': password,
      'location': location.toJson(),
      'productFavorite': productFavorite,
    };
  }
}
