import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuku/models/product.dart';

class ProductService with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/products'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      _products = responseData.map((data) => Product.fromJson(data)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
