class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final int stock;

  Product({required this.id, required this.name, required this.description, required this.price, required this.stock});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      stock: json['stock'],
    );
  }
}
