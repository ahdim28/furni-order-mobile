import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../controllers/cart_controller.dart';
import '../../models/product.dart';
import 'custom_checkbox.dart';

class ProductCart extends StatelessWidget {
  final ProductCartModel data;

  const ProductCart({super.key, required this.data});

  String _formatCurrency(double value) {
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Checkbox
        CustomCheckbox(
          value: data.isChecked, 
          onChanged: (value) {
            Provider.of<CartController>(context, listen: false).selectSingleProduct(
              data.product.id, 
              value!
            );
          }
        ),

        const SizedBox(width: 10,),
        
        // Product Image
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.grey,
            image: DecorationImage(
              image: AssetImage(
                data.product.image,
              ),
              fit: BoxFit.cover
            )
          ),
        ),

        const SizedBox(width: 10,),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Name
              Text(
                data.product.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 5,),
          
              // Product Price
              Text(
                _formatCurrency(data.product.price),
                style: const TextStyle(
                  color: Colors.green
                ),
              ),
              
              const SizedBox(height: 5,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Delete Product
                  _SmallButton(
                    onTap: () {
                      Provider.of<CartController>(context, listen: false).removeProduct(
                        data.product.id
                      );
                    },
                    data: data,
                    icon: Icons.delete,
                    backgroundColor: Colors.red
                  ),

                  Row(
                    children: [
                      // Decrement
                      _SmallButton(
                        onTap: () {
                          if (data.count > 1) {
                            Provider.of<CartController>(context, listen: false).decrementProductCart(
                              data.product.id
                            );
                          }
                        },
                        data: data,
                        icon: Icons.remove,
                        backgroundColor: data.count == 1
                          ? Colors.grey
                          : Colors.blue
                      ),
                      const SizedBox(width: 7,),
                      Text(
                        data.count.toString()
                      ),
                      const SizedBox(width: 7,),
                      _SmallButton(
                        onTap: () {
                          Provider.of<CartController>(context, listen: false).incrementProductCart(
                            data.product.id
                          );
                        },
                        data: data,
                        icon: Icons.add,
                        backgroundColor: Colors.blue
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _SmallButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color backgroundColor;
  
  const _SmallButton({
    required this.data, required this.onTap, required this.icon, required this.backgroundColor,
  });

  final ProductCartModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}