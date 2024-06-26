import 'package:furni_order/models/product.dart';

final List<CategoryProductModel> categories = [
  CategoryProductModel(
    id: '1',
    name: 'Kursi',
    isActive: true,
  ),
  CategoryProductModel(
    id: '2',
    name: 'Meja',
    isActive: false,
  ),
  CategoryProductModel(
    id: '3',
    name: 'Sofa',
    isActive: false,
  ),
  CategoryProductModel(
    id: '4',
    name: 'Lemari',
    isActive: false,
  ),
];

final List<ProductModel> products = [
  ProductModel(
    id: '1',
    name: 'Luke Kursi Kantor Sandaran Tinggi - Hitam', 
    description: '',
    price: 2000000, 
    rating: 4.5, 
    reviewCount: 5,
    image: 'assets/images/products/1.jpg'
  ),
  ProductModel(
    id: '2',
    name: 'Urania Kursi Gaming - Putih / hitam',
    description: '',
    price: 2600000, 
    rating: 5, 
    reviewCount: 10,
    discountPercentage: 5,
    image: 'assets/images/products/2.jpg'
  ),
  ProductModel(
    id: '3',
    name: 'Halley Meja Kantor - Cokelat', 
    description: '',
    price: 1400000, 
    rating: 4, 
    reviewCount: 3,
    discountPercentage: 10,
    image: 'assets/images/products/3.jpg'
  ),
  ProductModel(
    id: '4',
    name: 'Rana Meja Tamu Rectangle - Cokelat Maple', 
    description: '',
    price: 500000, 
    rating: 5, 
    reviewCount: 20,
    image: 'assets/images/products/4.jpg'
  ),
  ProductModel(
    id: '5',
    name: 'Selma Tasyi Sofa Modular Sudut Fabric - Cokelat',
    description: '',
    price: 4000000, 
    rating: 5, 
    reviewCount: 3,
    discountPercentage: 3,
    image: 'assets/images/products/5.jpg'
  ),
  ProductModel(
    id: '6',
    name: 'Selma Lewis Sofa Bed Fabric - Cokelat Muda',
    description: '',
    price: 5000000, 
    rating: 5, 
    reviewCount: 2,
    image: 'assets/images/products/6.jpg'
  ),
  ProductModel(
    id: '7',
    name: 'Selma Livia Lemari Pakaian 3 Pintu - Cokelat Oak',
    description: '',
    price: 1900000, 
    rating: 5, 
    reviewCount: 5,
    image: 'assets/images/products/7.jpg'
  ),
  ProductModel(
    id: '8',
    name: 'Rana Lemari Pakaian 2 Pintu - Putih/cokelat Maple',
    description: '',
    price: 1500000, 
    rating: 5, 
    reviewCount: 2,
    image: 'assets/images/products/8.jpg',
    discountPercentage: 15,
  ),
];
