import 'package:flutter/material.dart';

class PurchaseConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final String totalPrice;

  const PurchaseConfirmationDialog({
    super.key, 
    required this.onConfirm, 
    required this.totalPrice
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Konfirmasi Pembelian'),
        content: Text(
          'Total: $totalPrice',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          )
        ),
        actions: [
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 214, 214, 214)),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              'Batal',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              )
            ),
          ),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue),
            ),
            onPressed: onConfirm,
            child: const Text(
              'Konfirmasi',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              )
            ),
          ),
        ],
      );
  }
}