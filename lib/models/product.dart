class CategoryProductModel {
  final String id;
  final String name;
  bool isActive;

  CategoryProductModel({
    required this.id,
    required this.name,
    required this.isActive,
  });
}

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;
  final String image;
  final double? discountPercentage;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.image,
    this.discountPercentage,
  });
}

class ProductCartModel {
  final ProductModel product;
  final bool isChecked;
  final int count;

  ProductCartModel({
    required this.product,
    required this.isChecked,
    this.count = 1,
  });
}
