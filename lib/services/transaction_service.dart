import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:serpismotor2/models/product_model.dart';
import '../models/cart_model.dart';
import '../models/transaction_model.dart';

class TransactionService {
  String baseUrl = 'https://dashboard.servismo.me/api';

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

  // Future<List<TransactionModel>> getTransactions(String token) async {
  //   var url = '$baseUrl/transactions';
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': token,
  //   };

  //   var response = await http.get(
  //     Uri.parse(url),
  //     headers: headers,
  //   );

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body)['data']['data'];
  //     List<TransactionModel> transactions = [];

  //     for (var item in data) {
  //       var transaction = TransactionModel.fromJson(item);
  //       List<TransactionItemModel> items = [];

  //       for (var item in item['items']) {
  //         items.add(TransactionItemModel.fromJson(item));
  //       }

  //       transaction.items = items;
  //       transactions.add(transaction);
  //     }

  //     return transactions;
  //   } else {
  //     throw Exception('Failed to get transactions');
  //   }
  // }
}
