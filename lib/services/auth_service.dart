import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuku/models/user.dart';

class AuthService with ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<void> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      // Registration successful
    } else {
      // Handle error
      throw Exception('Failed to register');
    }
  }

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      _user = User(email: email, token: responseData['access_token']);
      notifyListeners();
    } else {
      throw Exception('Failed to login');
    }
  }

  void logout() {}
}
