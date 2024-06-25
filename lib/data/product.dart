final List<Map<String, String>> categories = [
  {
    'id': '1',
    'nama': 'Kursi',
  },
  {
    'id': '2',
    'nama': 'Meja',
  },
  {
    'id': '3',
    'nama': 'Sofa',
  },
  {
    'id': '4',
    'nama': 'Lemari',
  }
];

class ProductModel {
  final String name;
  final double price;
  final double rating;
  final int reviewCount;
  final String image;
  final double? discountPercentage;

  ProductModel({
    required this.name,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.image,
    this.discountPercentage,
  });
}

final List<ProductModel> products = [
  ProductModel(
    name: 'Luke Kursi Kantor Sandaran Tinggi - Hitam', 
    price: 2000000, 
    rating: 4.5, 
    reviewCount: 5,
    image: 'assets/images/products/1.jpg'
  ),
  // ProductModel(
  //   name: 'Meja Kantor - Putih', 
  //   price: 810000, 
  //   rating: 4.5, 
  //   reviewCount: 20,
  //   discountPercentage: 10,
  // ),
  // ProductModel(
  //   name: 'Meja Kantor - Hitam', 
  //   price: 900000, 
  //   rating: 4.5, 
  //   reviewCount: 20
  // ),
  // ProductModel(
  //   name: 'Meja Kantor - Hitam', 
  //   price: 900000, 
  //   rating: 4.5, 
  //   reviewCount: 20
  // ),
];
