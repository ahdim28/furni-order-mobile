import 'package:flutter/material.dart';
import 'package:furni_order/data/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  return _CategoryList(
                    data: categories[index]
                  );
                }, separatorBuilder: (BuildContext context, int index) { 
                  return SizedBox(width: 10);
                 },
              ),
            ),

            const SizedBox(height: 20),

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
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _ProductList(
                  data: products[index]
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
              // User Greeting
              Text(
                'Selamat Datang,',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w100,
                ),
              ),
              
              SizedBox(height: 5,),

              // Subtitle
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

// category list
class _CategoryList extends StatelessWidget {
  final Map<String, String> data;

  const _CategoryList({
    Key? key, 
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue, width: 2)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.home, color: Colors.blue),
              const SizedBox(width: 7),
              Text(
                data['nama']!, 
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue
                )
              )
            ],
          )
        ],
      ),
    );
  }
}

// product list
class _ProductList extends StatelessWidget {
  final ProductModel data;
  
  const _ProductList({
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
          SizedBox(
            height: 180,
            width: 190,
            child: Image.asset(
              'assets/images/products/1.jpg',
              fit: BoxFit.cover,
            )
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
