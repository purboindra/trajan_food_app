class FavoriteModel {
  final String imageUrl;
  final String rating;
  final String restoName;
  final String menuTitle;
  final String address;
  final bool isFavorite;
  final String price;

  FavoriteModel({
    required this.imageUrl,
    required this.address,
    required this.isFavorite,
    required this.restoName,
    required this.rating,
    required this.menuTitle,
    required this.price,
  });

  FavoriteModel copyWith({
    String? imageUrl,
    String? address,
    bool? isFavorite,
    String? restoName,
    String? rating,
    String? menuTitle,
    String? price,
  }) {
    return FavoriteModel(
      imageUrl: imageUrl ?? this.imageUrl,
      address: address ?? this.address,
      isFavorite: isFavorite ?? this.isFavorite,
      restoName: restoName ?? this.restoName,
      rating: rating ?? this.rating,
      menuTitle: menuTitle ?? this.menuTitle,
      price: price ?? this.price,
    );
  }
}
