import 'package:flutter/foundation.dart';
import 'cart_item.dart';

class CartShow {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartShow(
      {required this.title,
      required this.id,
      required this.price,
      required this.quantity});
}

class Cart with ChangeNotifier {
  final Map<String, CartShow> _cartitems = {};

  Map<String, CartShow> get cartitems => _cartitems;

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
          (existingCartItem) => CartShow(
                title: existingCartItem.title,
                id: existingCartItem.id.toString(),
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      _cartitems.putIfAbsent(
          productId,
          () => CartShow(
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

  void removeSingleItem(String productId) {
    if (_cartitems[productId]!.quantity > 1) {
      _cartitems.update(
          productId,
          (existingCartItem) => CartShow(
                quantity: existingCartItem.quantity - 1,
                price: existingCartItem.price,
                id: existingCartItem.id,
                title: existingCartItem.title,
              ));
    } else {
      _cartitems.remove(productId);
    }
    notifyListeners();
  }
}
