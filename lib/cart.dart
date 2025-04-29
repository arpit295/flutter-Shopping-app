import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.title,
      required this.id,
      required this.price,
      required this.quantity});
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _cartitems = {};

  Map<String, CartItem> get cartitems => _cartitems;

  int get itemCount => _cartitems.length;

  double get totalAmount {
    var total = 0.0;
    _cartitems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, String price, String title) {
    if (_cartitems.containsKey(productId)) {
      _cartitems.update(
          productId,
          (existingCartItem) => CartItem(
              title: existingCartItem.title,
              id: existingCartItem.id.toString(),
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1));
    } else {
      _cartitems.putIfAbsent(
          productId,
          () => CartItem(
              title: title,
              id: DateTime.now().toString(),
              price: double.parse(price),
              quantity: 1));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _cartitems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartitems.clear();
    notifyListeners();
  }
}
