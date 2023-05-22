import 'package:flutter/material.dart';
import 'package:serpismotor2/models/cart_model.dart';
import 'package:serpismotor2/services/transaction_service.dart';

import '../models/transaction_model.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  set transactions(List<TransactionModel> transactions) {
    _transactions = transactions;
    notifyListeners();
  }

  Future<bool> checkout(String token, List<CartModel> carts, String address,
      double totalPrice) async {
    try {
      if (await TransactionService()
          .checkout(token, carts, address, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> getTransactions(String token) async {
    try {
      List<TransactionModel> transactions =
          await TransactionService().getTransactions(token);
      _transactions = transactions;
    } catch (e) {
      print(e);
      throw Exception('Failed to get transaction list');
    }
  }

  Future<bool> deleteTransaction(String token, int transactionId) async {
    try {
      if (await TransactionService().deleteTransaction(token, transactionId)) {
        _transactions
            .removeWhere((transaction) => transaction.id == transactionId);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
