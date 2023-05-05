import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serpismotor2/providers/transaction_provider.dart';

class TransactionListWidget extends StatelessWidget {
  final String token;

  TransactionListWidget({required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction List'),
      ),
      body: FutureBuilder(
        future: Provider.of<TransactionProvider>(context, listen: false)
            .getTransactions(token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load transaction list'),
            );
          } else {
            return Consumer<TransactionProvider>(
              builder: (context, transactionProvider, _) {
                if (transactionProvider.transactions.isEmpty) {
                  return Center(
                    child: Text('No transaction found'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: transactionProvider.transactions.length,
                    itemBuilder: (context, index) {
                      final transaction =
                          transactionProvider.transactions[index];
                      return ListTile(
                        title: Text(transaction.address),
                        subtitle: Text(transaction.totalPrice.toString()),
                      );
                    },
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
