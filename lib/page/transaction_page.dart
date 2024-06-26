import 'package:flutter/material.dart';
import 'package:furni_order/data/transaction.dart';
import 'package:furni_order/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
        itemCount: transactions.length,
          itemBuilder: (context, index) {
          return _TransactionItem(transaction: transactions[index]);
        },
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  _TransactionItem({required this.transaction});

  String get formattedAmount {
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(transaction.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        title: Text(
          transaction.noTrx,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal : ${transaction.date}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              formattedAmount,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.green
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {}, 
              child: Text(
                transaction.status == '0' ? 'DIPROSES' : (transaction.status == '1' ? 'SELESAI' : 'GAGAL'),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: transaction.status == '0' ? Colors.grey : (transaction.status == '1' ? Colors.green : Colors.red),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}