import 'package:flutter/material.dart';
import 'package:furni_order/models/product.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../controllers/cart_controller.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  String get formattedPrice {
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(product.price);
  }

  int? getDiscountPrice() {
    int? discountedPrice;

    if (product.discountPercentage != null) {
      discountedPrice = (product.price - (product.price * product.discountPercentage!/100)).toInt();
    }

    return discountedPrice;
  }

  String get formattedPriceDiscount {
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(getDiscountPrice() ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          'Furni Order',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Provider.of<CartController>(context, listen: false).add(
            ProductCartModel(
              product: product, 
              isChecked: true,
            )
          );
          
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Produk ditambahkan kedalam keranjang!'),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15)
            )
          ),
          child: const Text(
            'Masukan Keranjang',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.grey[300],
                child: Center(
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 4),

            Text(
              formattedPrice,
              style: TextStyle(
                decoration: product.discountPercentage != null
                  ? TextDecoration.lineThrough
                  : null,
                color: product.discountPercentage == null
                  ? Colors.green
                  : Colors.red,
                fontSize: product.discountPercentage == null
                  ? 20
                  : 14,
                fontWeight: FontWeight.w800
              ),
            ),
            
            // discount price
            product.discountPercentage != null
              ? Text(
                  formattedPriceDiscount,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                )
              : const SizedBox(),

            const SizedBox(height: 4),

            Row(
              children: [
                Icon(Icons.star, color: Colors.orange.shade300, size: 24),
                const SizedBox(width: 4),
                Text(product.rating.toString()),
                const SizedBox(width: 8),
                Text('(${product.reviewCount} Ulasan)'),
                const Spacer(),
                product.discountPercentage != null
                  ? Container(
                    padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red
                      ),
                      child: Text(
                        '${product.discountPercentage!.toInt()}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                    )
                  : const SizedBox()
              ],
            ),

            const SizedBox(height: 16),
            
            Text(product.description),
          ],
        ),
      ),
    );
  }
}