import 'package:serpismotor2/models/product_model.dart';

class TransactionItemModel {
  late int id;
  late int quantity;
  late ProductModel product;

  TransactionItemModel({
    required this.id,
    required this.quantity,
    required this.product,
  });

  TransactionItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'product': product.toJson(),
    };
  }
}
