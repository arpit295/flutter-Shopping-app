import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/orders.dart' show Orders;
import 'package:shopping_app/orders_item.dart';
import 'package:shopping_app/product_overview_screen.dart';

class OrdersDetail extends StatelessWidget {
  const OrdersDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Orders',
          style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return OrdersItem(order: orderData.orders[index]);
        },
        itemCount: orderData.orders.length,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Hello Friends!',
                style:
                    TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Lato'),
              ),
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.shop,
                color: Colors.grey,
              ),
              title: Text(
                'Shop',
                style:
                    TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Lato'),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductOverviewScreen()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.payment,
                color: Colors.grey,
              ),
              title: Text(
                'Orders',
                style:
                    TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Lato'),
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => OrdersDetail()));
              },
            )
          ],
        ),
      ),
    );
  }
}
