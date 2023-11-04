import 'package:trajan_food_app/features/models/location_model.dart';

class UserModel {
  final String id;
  final String uid;
  final String accessToken;
  final String token;
  final String userName;
  final String email;
  final String password;
  final LocationModel location;
  final String photoUrl;
  final DateTime createdAt;
  final List<dynamic> productFavorite;

  UserModel({
    required this.id,
    required this.uid,
    required this.accessToken,
    required this.token,
    required this.userName,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.location,
    required this.productFavorite,
    required this.photoUrl,
  });

  UserModel copyWith({
    String? id,
    String? uid,
    String? accessToken,
    String? token,
    String? userName,
    String? email,
    String? password,
    LocationModel? location,
    String? photoUrl,
    DateTime? createdAt,
    List<dynamic>? productFavorite,
  }) {
    return UserModel(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        accessToken: accessToken ?? this.accessToken,
        token: token ?? this.token,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        location: location ?? this.location,
        productFavorite: productFavorite ?? this.productFavorite,
        photoUrl: photoUrl ?? this.photoUrl);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        uid: json['uid'],
        accessToken: json['accessToken'],
        token: json['token'],
        userName: json['userName'],
        createdAt: json['createdAt'],
        email: json['email'],
        password: json['password'],
        location: json['location'],
        photoUrl: json['photoUrl'],
        productFavorite: json['productFavorite']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'userName': userName,
      'token': token,
      'accessToken': accessToken,
      'createdAt': createdAt.toIso8601String(),
      'email': email,
      'password': password,
      'location': location.toJson(),
      'photoUrl': photoUrl,
      'productFavorite': productFavorite,
    };
  }
}
