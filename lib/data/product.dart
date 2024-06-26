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
  ProductModel(
    name: 'Urania Kursi Gaming - Putih / hitam', 
    price: 2600000, 
    rating: 5, 
    reviewCount: 10,
    discountPercentage: 5,
    image: 'assets/images/products/2.jpg'
  ),
  ProductModel(
    name: 'Halley Meja Kantor - Cokelat', 
    price: 1400000, 
    rating: 4, 
    reviewCount: 3,
    discountPercentage: 10,
    image: 'assets/images/products/3.jpg'
  ),
  ProductModel(
    name: 'Rana Meja Tamu Rectangle - Cokelat Maple', 
    price: 500000, 
    rating: 5, 
    reviewCount: 20,
    image: 'assets/images/products/4.jpg'
  ),
  ProductModel(
    name: 'Selma Tasyi Sofa Modular Sudut Fabric - Cokelat', 
    price: 4000000, 
    rating: 5, 
    reviewCount: 3,
    discountPercentage: 3,
    image: 'assets/images/products/5.jpg'
  ),
  ProductModel(
    name: 'Selma Lewis Sofa Bed Fabric - Cokelat Muda', 
    price: 5000000, 
    rating: 5, 
    reviewCount: 2,
    image: 'assets/images/products/6.jpg'
  ),
  ProductModel(
    name: 'Selma Livia Lemari Pakaian 3 Pintu - Cokelat Oak', 
    price: 1900000, 
    rating: 5, 
    reviewCount: 5,
    image: 'assets/images/products/7.jpg'
  ),
  ProductModel(
    name: 'Rana Lemari Pakaian 2 Pintu - Putih/cokelat Maple', 
    price: 1500000, 
    rating: 5, 
    reviewCount: 2,
    image: 'assets/images/products/8.jpg',
    discountPercentage: 15,
  ),
];
