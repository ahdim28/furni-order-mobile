import 'package:flutter/material.dart';
import 'package:furni_order/controllers/cart_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'widget/dialog_success.dart';
import 'widget/purchase_confirmation_dialog.dart';
import 'widget/custom_checkbox.dart';
import 'widget/product_cart_list.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

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
        color: const Color(0xFFD9D9D9),
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
                ),
                Consumer<CartController>(
                  builder: (context, cart, child) {
                    return Text(
                      _formatCurrency(cart.totalPrice),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green
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
                                return const DialogSuccess(
                                  title: 'Berhasil', 
                                  description: 'Pembelian Berhasil'
                                );
                              },
                            );
                          },
                          totalPrice: _formatCurrency(cart.totalPrice),
                        ),
                      );
                    } else {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text('Tidak ada item yang dipilih!'),
                      //   ),
                      // );
                    }
                  }, 
                  child: const Text(
                    'Beli'
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