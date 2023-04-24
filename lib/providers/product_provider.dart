import 'package:flutter/material.dart';
import 'package:serpismotor2/models/product_model.dart';
import 'package:serpismotor2/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProduct();
      _products = products;
    } catch (e) {
      print(e);
    }
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    try {
      List<ProductModel> products = await ProductService().getProduct();
      List<ProductModel> filteredProducts =
          products.where((p) => p.category.name == category).toList();
      return filteredProducts;
    } catch (e) {
      print(e);
      throw Exception('Failed to get products by category!');
    }
  }
}
