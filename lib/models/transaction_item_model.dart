import 'package:serpismotor2/models/category_model.dart';
import '../models/product_model.dart';

class TransactionItemModel {
  final int id;
  final int quantity;
  final ProductModel product;

  TransactionItemModel({
    required this.id,
    required this.quantity,
    required this.product,
  });
}
