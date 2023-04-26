import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:serpismotor2/models/product_model.dart';

class ProductService {
  String baseUrl = 'https://dashboard.servismo.me/api';

  Future<List<ProductModel>> getProduct() async {
    var url = '$baseUrl/products?limit=100';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Failed to get products!');
    }
  }

  Future<List<ProductModel>> getProductByCategory(String category) async {
    var url = '$baseUrl/products?category=$category';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Failed to get products by category!');
    }
  }
}
