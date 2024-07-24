import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuku/services/order_service.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderService>(context).orders;

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return ListTile(
          title: Text('Order ID: ${order.id}'),
          subtitle: Text('Total: \$${order.totalPrice}'),
        );
      },
    );
  }
}
