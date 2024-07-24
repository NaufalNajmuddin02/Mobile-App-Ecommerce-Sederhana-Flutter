import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuku/models/order.dart';

class OrderService with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  Future<void> fetchOrders(String token) async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:5000/orders'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      _orders = responseData.map((data) => Order.fromJson(data)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<void> createOrder(Order order, String token) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/orders'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'user_id': order.userId,
        'product_id': order.productId,
        'quantity': order.quantity,
        'total_price': order.totalPrice,
      }),
    );

    if (response.statusCode == 201) {
      fetchOrders(token);
    } else {
      throw Exception('Failed to create order');
    }
  }
}
