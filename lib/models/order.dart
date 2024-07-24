class Order {
  final String id;
  final String userId;
  final String productId;
  final int quantity;
  final double totalPrice;

  Order({required this.id, required this.userId, required this.productId, required this.quantity, required this.totalPrice});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      userId: json['user_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      totalPrice: json['total_price'],
    );
  }
}
