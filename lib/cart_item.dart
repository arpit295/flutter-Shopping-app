import 'package:flutter/material.dart ';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;

  CartItem(
      {required this.quantity,
      required this.price,
      required this.id,
      required this.title,
      required this.productId});

  @override
  Widget build(BuildContext context) {
    final cartDetails = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      onDismissed: (direction) {
        cartDetails.removeItem(productId);
      },
      key: ValueKey(id),
      background: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text('Are You Sure?'),
                  content: Text(
                    'Do you want to remove the item from the cart ?',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.orange),
                        ))
                  ],
                ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.purple,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FittedBox(
                  child: Text(
                    '₹ $price',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Lato'),
            ),
            subtitle: Text(
              'Total : ₹ ${price * quantity}',
              style: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Lato'),
            ),
            trailing: Text(
              '$quantity x ',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lato'),
            ),
          ),
        ),
      ),
    );
  }
}
