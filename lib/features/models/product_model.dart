import 'package:trajan_food_app/features/models/resto_model.dart';

enum ProductType { recommended, onlyForYou, favorite, blackFriday, other }

class ProductModel {
  final String productName;
  final String price;
  final double rating;
  final String productImage;
  final String productId;
  final RestoModel restoModel;
  final ProductType productType;
  final bool isHalal;

  ProductModel({
    required this.price,
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productType,
    required this.rating,
    required this.restoModel,
    required this.isHalal,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        price: json["price"],
        productId: json["product_id"],
        productImage: json["product_image"],
        productName: json["product_name"],
        productType: ProductType.values.firstWhere(
            (element) => element.toString() == json["product_type"],
            orElse: () => ProductType.favorite),
        rating: json["rating"],
        restoModel: RestoModel.fromJson(json["resto"]),
        isHalal: json["is_halal"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "price": price,
      "product_id": productId,
      "product_name": productName,
      "product_image": productImage,
      "rating": rating,
      "resto": restoModel.toJson(),
      "is_halal": isHalal,
      "product_type": productType.toString(),
    };
  }
}
