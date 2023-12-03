// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:trajan_food_app/features/models/resto_model.dart';

class OrderModel {
  String uid;
  String email;
  String productName;
  int productId;
  String productImage;
  int createdAt;
  int expiredAt;
  RestoModel restoModel;
  int price;
  int rating;
  int totalPrice;
  int quantity;
  String status;
  OrderModel({
    required this.uid,
    required this.email,
    required this.productName,
    required this.productId,
    required this.productImage,
    required this.createdAt,
    required this.expiredAt,
    required this.restoModel,
    required this.price,
    required this.rating,
    required this.totalPrice,
    required this.quantity,
    required this.status,
  });

  OrderModel copyWith({
    String? uid,
    String? email,
    String? productName,
    int? productId,
    String? productImage,
    int? createdAt,
    int? expiredAt,
    RestoModel? restoModel,
    int? price,
    int? rating,
    int? totalPrice,
    int? quantity,
    String? status,
  }) {
    return OrderModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      productName: productName ?? this.productName,
      productId: productId ?? this.productId,
      productImage: productImage ?? this.productImage,
      createdAt: createdAt ?? this.createdAt,
      expiredAt: expiredAt ?? this.expiredAt,
      restoModel: restoModel ?? this.restoModel,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      totalPrice: totalPrice ?? this.totalPrice,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'productName': productName,
      'productId': productId,
      'productImage': productImage,
      'createdAt': createdAt,
      'expiredAt': expiredAt,
      'restoModel': restoModel.toJson(),
      'price': price,
      'rating': rating,
      'totalPrice': totalPrice,
      'quantity': quantity,
      'status': status,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      uid: map['uid'] as String,
      email: map['email'] as String,
      productName: map['productName'] as String,
      productId: map['productId'] as int,
      productImage: map['productImage'] as String,
      createdAt: map['createdAt'] as int,
      expiredAt: map['expiredAt'] as int,
      restoModel:
          RestoModel.fromJson(map['restoModel'] as Map<String, dynamic>),
      price: map['price'] as int,
      rating: map['rating'] as int,
      totalPrice: map['totalPrice'] as int,
      quantity: map['quantity'] as int,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(uid: $uid, email: $email, productName: $productName, productId: $productId, productImage: $productImage, createdAt: $createdAt, expiredAt: $expiredAt, restoModel: $restoModel, price: $price, rating: $rating, totalPrice: $totalPrice, quantity: $quantity, status: $status)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.email == email &&
        other.productName == productName &&
        other.productId == productId &&
        other.productImage == productImage &&
        other.createdAt == createdAt &&
        other.expiredAt == expiredAt &&
        other.restoModel == restoModel &&
        other.price == price &&
        other.rating == rating &&
        other.totalPrice == totalPrice &&
        other.quantity == quantity &&
        other.status == status;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        productName.hashCode ^
        productId.hashCode ^
        productImage.hashCode ^
        createdAt.hashCode ^
        expiredAt.hashCode ^
        restoModel.hashCode ^
        price.hashCode ^
        rating.hashCode ^
        totalPrice.hashCode ^
        quantity.hashCode ^
        status.hashCode;
  }
}
