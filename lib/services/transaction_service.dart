import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:serpismotor2/models/product_model.dart';
import '../models/cart_model.dart';
import '../models/transaction_model.dart';

class TransactionService {
  String baseUrl = 'https://dashboard.servismo.me/api';
  // String baseUrl = 'http://yantoserpis.my.id/api/';

  Future<bool> checkout(String token, List<CartModel> carts, String address,
      double totalPrice) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'address': address,
        'items': carts
            .map(
              (cart) => {
                'id': cart.product.id,
                'quantity': cart.quantity,
              },
            )
            .toList(),
        'total_price': totalPrice,
      },
    );

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to checkout');
    }
  }

  Future<List<TransactionModel>> getTransactions(String token) async {
    var url = '$baseUrl/transactions?limit=100';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data']['data'];
      List<TransactionModel> transactions = [];

      for (var item in data) {
        transactions.add(TransactionModel.fromJson(item));
      }

      return transactions;
    } else {
      throw Exception('Failed to get transactions');
    }
  }

  Future<bool> deleteTransaction(String token, int transactionId) async {
    var url = '$baseUrl/transactions/$transactionId';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete transaction');
    }
  }
}
