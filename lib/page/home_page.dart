import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../data/product.dart';
import '../models/product.dart';
import 'product_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // profile information
            const _ProfileInformation(),
            const SizedBox(height: 20),

            // category product list
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return _CategoryProductList(
                    category: categories[index],
                    onTap: (){
                      setState(() {
                        categories[index].isActive = !categories[index].isActive;
                      });
                    },
                  );
                }, separatorBuilder: (BuildContext context, int index) { 
                  return const SizedBox(width: 10);
                 },
              ),
            ),
            const SizedBox(height: 20),

            // product list
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 290
              ), 
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _ProductList(
                  product: products[index]
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

// profile information
class _ProfileInformation extends StatelessWidget {
  const _ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
            maxRadius: 15,
            minRadius: 15,
          ),
        ),

        SizedBox(width: 15,),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang,',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w100,
                ),
              ),
              
              SizedBox(height: 5),

              Text(
                'Ahmad Dimyati',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// category product list
class _CategoryProductList extends StatelessWidget {
  final CategoryProductModel category;
  final Function() onTap;

  const _CategoryProductList({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: category.isActive ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue, width: 2)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.list, color: category.isActive ? Colors.white : Colors.blue),
                const SizedBox(width: 7),
                Text(
                  category.name, 
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: category.isActive ? Colors.white : Colors.blue
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// product list
class _ProductList extends StatelessWidget {
  final ProductModel product;
  
  const _ProductList({required this.product});

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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailPage(
            product: product
          )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: const Offset(1, 2), 
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.25)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // product image
            SizedBox(
              height: 180,
              width: 190,
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              )
            ),

            Container(
              height: 110,
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // product name
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 3,),

                  // product price
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          formattedPrice,
                          style: TextStyle(
                            decoration: product.discountPercentage != null
                              ? TextDecoration.lineThrough
                              : null,
                            color: product.discountPercentage == null
                              ? Colors.green
                              : null,
                            fontSize: 12,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                      ),

                      const SizedBox(width: 8,),
                      
                      // discount
                      product.discountPercentage != null
                        ? Container(
                          padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red
                            ),
                            child: Text(
                              '${product.discountPercentage!.toInt()}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                          )
                        : const SizedBox()
                    ],
                  ),

                  // discount price
                  product.discountPercentage != null
                    ? Text(
                        formattedPriceDiscount,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    : const SizedBox(),

                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // product rating
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange.shade300),
                              Text(
                                product.rating.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                                ),
                              )
                            ],
                          ),
                    
                          // product review count
                          Text(
                            '${product.reviewCount} Ulasan',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black45
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}