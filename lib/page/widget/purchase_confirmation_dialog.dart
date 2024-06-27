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
        content: Text('Total: $totalPrice'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: onConfirm,
            child: const Text('Konfirmasi'),
          ),
        ],
      );
  }
}