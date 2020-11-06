import 'package:flutter/foundation.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final DateTime dateTime;
  final List<CartItem> products;

  OrderItem({
    @required this.amount,
    @required this.dateTime,
    @required this.id,
    @required this.products,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProduct, double totolAmount) {
    _orders.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          dateTime: DateTime.now(),
          amount: totolAmount,
          products: cartProduct,
        ));
    notifyListeners();
  }
}
