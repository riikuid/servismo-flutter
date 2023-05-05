import 'package:flutter/material.dart';
import 'package:serpismotor2/models/cart_model.dart';
import 'package:serpismotor2/services/transaction_service.dart';

import '../models/transaction_model.dart';

class TransactionProvider with ChangeNotifier {
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
}
