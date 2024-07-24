import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuku/services/order_service.dart';
import 'package:tuku/widgets/order_list.dart';
import 'package:tuku/services/auth_service.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthService>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: FutureBuilder(
        future: Provider.of<OrderService>(context, listen: false).fetchOrders(user!.token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading orders'));
          } else {
            return OrderList();
          }
        },
      ),
    );
  }
}
