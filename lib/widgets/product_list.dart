import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuku/services/product_service.dart';
import 'package:tuku/screens/product_screen.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductService>(context).products;

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text('\$${product.price}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductScreen(product)),
            );
          },
        );
      },
    );
  }
}
