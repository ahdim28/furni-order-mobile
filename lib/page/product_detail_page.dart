import 'package:flutter/material.dart';
import 'package:furni_order/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Furni Order'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.grey[300],
                child: Center(
                  child: Icon(
                    Icons.image,
                    size: 100,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Meja Kantor - Hitam',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Rp900.000',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 24),
                SizedBox(width: 4),
                Text('4.5'),
                SizedBox(width: 8),
                Text('(20 Ulasan)'),
                Spacer(),
                Text('1/5'),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Spesifikasi'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Informasi'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Informasi Produk\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex.',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Beli Sekarang'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50)
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {},
        ),
      ),
    );
  }
}