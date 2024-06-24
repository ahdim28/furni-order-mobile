import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
  });
}

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key});

  final List<Transaction> transactions = [
    Transaction(title: 'Groceries', amount: 45.50, date: DateTime.now()),
    Transaction(title: 'Utilities', amount: 120.75, date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(title: 'Gym Membership', amount: 35.00, date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(title: 'Dining Out', amount: 60.00, date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(title: 'Online Shopping', amount: 150.00, date: DateTime.now().subtract(Duration(days: 4))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction List'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('\$${transaction.amount}'),
                  ),
                ),
              ),
              title: Text(
                transaction.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
              ),
            ),
          );
        },
      ),
    );
  }
}