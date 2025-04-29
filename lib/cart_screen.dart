import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart.dart';
import 'package:shopping_app/orders.dart';
import 'cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsetsDirectional.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Chip(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    label: Text(
                      '₹ ${cart.totalAmount}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.cartitems.values.toList(), cart.totalAmount);
                      cart.clearCart();
                    },
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lato'),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartitems.length,
              itemBuilder: (context, index) {
                return ci.CartItem(
                  title: cart.cartitems.values.toList()[index].title,
                  id: cart.cartitems.values.toList()[index].id,
                  price: cart.cartitems.values.toList()[index].price,
                  quantity: cart.cartitems.values.toList()[index].quantity,
                  productId: cart.cartitems.keys.toList()[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
