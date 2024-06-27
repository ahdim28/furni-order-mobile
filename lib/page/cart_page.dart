import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../controllers/cart_controller.dart';
import 'widget/purchase_confirmation_dialog.dart';
import 'widget/custom_checkbox.dart';
import 'widget/product_cart_list.dart';

class CartPage extends StatefulWidget {

  final Function() onTransaction;

  const CartPage({super.key, required this.onTransaction});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String _formatCurrency(double value) {
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(value);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.all(15),
        color: const Color.fromARGB(255, 233, 244, 253),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Total Price
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                  ),
                ),
                Consumer<CartController>(
                  builder: (context, cart, child) {
                    return Text(
                      _formatCurrency(cart.totalPrice),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.green,
                        fontSize: 18
                      ),
                    );
                  }
                ),
              ],
            ),

            // Purchase Button
            Consumer<CartController>(
              builder: (context, cart, child) {
                return ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  onPressed: () {
                    if (!cart.noneChecked) {
                      showDialog(
                        context: context, 
                        builder: (context) => PurchaseConfirmationDialog(
                          onConfirm: () {
                            Navigator.of(context).pop(false);

                            Provider.of<CartController>(context, listen: false).purchase();
                            
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  contentPadding: EdgeInsets.zero,
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      LottieBuilder.asset(
                                        "assets/lottie/transaction-success.json",
                                        width: 150,
                                        height: 150,
                                        repeat: false,
                                      ),
                                      const SizedBox(height: 2),
                                      const Text(
                                        'BERHASIL',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      
                                      const Text(
                                        'Pembelian berhasil',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                      ),
                                      const SizedBox(height: 16),
                                      
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          widget.onTransaction();
                                        },
                                        child: const Text(
                                          'OK',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          totalPrice: _formatCurrency(cart.totalPrice),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Tidak ada item yang dipilih!'),
                        ),
                      );
                    }
                  }, 
                  child: const Text(
                    'Beli',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )
                  )
                );
              }
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Consumer<CartController>(
          builder: (context, cart, child) {
            if (cart.items.isNotEmpty) {
              // If cart is not empty.
              return Column(
                children: [
                  // Select All Checkbox
                  Row(
                    children: [
                      CustomCheckbox(
                        value: cart.areAllChecked,
                        onChanged: (status) {
                          Provider.of<CartController>(context, listen: false).selectOrUnselectAll(
                            status!
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Pilih Semua',
                        style: TextStyle(
                        ),
                      ),
                    ],
                  ),
              
                  const SizedBox(height: 20,),
              
                  // Cart Product List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      return ProductCart(
                        data: cart.items[index],
                      );
                    }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 7,),
                  )
                ],
              );
            } else {
              // If cart is empty.
              return const Center(
                child: Text(
                  'Keranjang masih kosong!'
                ),
              );
            }
          }
        ),
      ),
    );
  }
}