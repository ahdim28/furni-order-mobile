// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductModel {
  final String name;
  final double price;
  final double rating;
  final int reviewCount;
  final double? discountPercentage;

  ProductModel({
    required this.name,
    required this.price,
    required this.rating,
    required this.reviewCount,
    this.discountPercentage,
  });
}

// Data Source - Product List
List<ProductModel> productList = [
  ProductModel(
    name: 'Meja Kantor - Hitam', 
    price: 900000, 
    rating: 4.5, 
    reviewCount: 20
  ),
  ProductModel(
    name: 'Meja Kantor - Putih', 
    price: 810000, 
    rating: 4.5, 
    reviewCount: 20,
    discountPercentage: 10,
  ),
  ProductModel(
    name: 'Meja Kantor - Hitam', 
    price: 900000, 
    rating: 4.5, 
    reviewCount: 20
  ),
  ProductModel(
    name: 'Meja Kantor - Hitam', 
    price: 900000, 
    rating: 4.5, 
    reviewCount: 20
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Furni Order',
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // Profile Image, User Name, and Subtitle
            const _ProfileInformation(),

            const SizedBox(height: 20,),

            // Search
            const _SearchInput(),

            const SizedBox(height: 20.0,),

            // Store Item List
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 290
              ), 
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return _ProductListItem(
                  data: productList[index]
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              prefixIcon: Icon(Icons.search),
              hintText: 'Cari produk...',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        Icon(Icons.filter_list)
      ],
    );
  }
}

class _ProfileInformation extends StatelessWidget {
  const _ProfileInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile Image
        Container(
          width: 75,
          height: 75,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black54)
          ),
          child: const Icon(
            Icons.person,
            size: 30,
          ),
        ),

        const SizedBox(width: 15,),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Greeting
              Text(
                'Hai, Ahmad Dimayati',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              ),
              
              SizedBox(height: 5,),

              // Subtitle
              Text(
                'Silakan cari produk mebel yang Anda inginkan',
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProductListItem extends StatelessWidget {
  final ProductModel data;
  
  const _ProductListItem({
    Key? key, 
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? discountedPrice;

    if (data.discountPercentage != null) {
      discountedPrice = (data.price - (data.price * data.discountPercentage!/100)).toInt();
    }

    return Container(
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
          // Product Image
          const SizedBox(
            height: 180,
            child: Placeholder()
          ),

          Container(
            height: 110,
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  data.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 3,),

                // Product Price
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Rp.${data.price.toInt()}',
                        style: TextStyle(
                          decoration: data.discountPercentage != null
                            ? TextDecoration.lineThrough
                            : null,
                          color: data.discountPercentage == null
                            ? Colors.green
                            : null,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    const SizedBox(width: 8,),
                    
                    // Discount Information
                    data.discountPercentage != null
                      ? Container(
                        padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.orange
                          ),
                          child: Text(
                            '${data.discountPercentage!.toInt()}%',
                            style: const TextStyle(
                              color: Colors.white
                            ),
                          ),
                        )
                      : const SizedBox()
                  ],
                ),

                // Discounted Price
                data.discountPercentage != null
                  ? Text(
                      'Rp.${discountedPrice!}',
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
                        // Product Rating
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow,),
                            Text(
                              data.rating.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                  
                        // Product Review Count
                        Text(
                          '${data.reviewCount} Ulasan',
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
    );
  }
}