// import 'package:flutter/foundation.dart';
// import 'package:serpismotor2/models/transaction_item_model.dart';

// class TransactionModel {
//   final int id;
//   final String address;
//   final double totalPrice;
//   final DateTime updatedTime;
//   final List<TransactionItemModel> item;

//   TransactionModel(
//       {required this.id,
//       required this.address,
//       required this.totalPrice,
//       required this.updatedTime,
//       required this.item});

//   factory TransactionModel.fromJson(Map<String, dynamic> json) {
//     final id = json['id'];
//     final address = json['address'];
//     final totalPrice = double.parse(json['total_price'].toString());
//     final item = json['items']
//         .map<TransactionItemModel>(
//             (item) => TransactionItemModel.fromJson(item))
//         .toList();
//     final updatedAt = DateTime.parse(json['updated_at']);
//   }
// }
