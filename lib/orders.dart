import 'package:flutter/cupertino.dart';
import 'package:shopping_app/cart.dart';

class OrderShow {
  final String id;
  final double amount;
  final List<CartShow> products;
  final DateTime dateTime;

  OrderShow(
      {required this.id,
      required this.products,
      required this.amount,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  final List<OrderShow> _orders = [];
  List<OrderShow> get orders => _orders;

  void addOrder(List<CartShow> cartProducts, double total) {
    _orders.insert(
      0,
      OrderShow(
        id: DateTime.now().toString(),
        products: cartProducts,
        amount: total,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
