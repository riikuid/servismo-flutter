import 'package:serpismotor2/models/transaction_item_model.dart';

class TransactionModel {
  late int id;
  late String address;
  late double totalPrice;
  late DateTime updatedAt;
  late List<TransactionItemModel> items;

  TransactionModel({
    required this.id,
    required this.address,
    required this.totalPrice,
    required this.updatedAt,
    required this.items,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    totalPrice = double.parse(json['total_price'].toString());
    items = json['items']
        .map<TransactionItemModel>(
            (item) => TransactionItemModel.fromJson(item))
        .toList();
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'total_price': totalPrice,
      'items': items.map((item) => item.toJson()).toList(),
      'updated_at': updatedAt.toString(),
    };
  }
}
