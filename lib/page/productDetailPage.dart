import 'package:flutter/material.dart';
import 'package:furni_order/data/product.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel data;

  const ProductDetailPage({super.key, required this.data});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            widget.data.name,
          ),
        ]
      )
    );
  }
}