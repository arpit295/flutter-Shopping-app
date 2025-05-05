import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'orders.dart';

class OrdersItem extends StatefulWidget {
  final OrderShow order;

  OrdersItem({required this.order});

  @override
  State<OrdersItem> createState() => _OrdersItemState();
}

class _OrdersItemState extends State<OrdersItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '₹ ${widget.order.amount}',
              style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
              style: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Lato'),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.products.length * 30 + 10, 100),
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            prod.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Lato'),
                          ),
                          Text(
                            '${prod.quantity} x ₹${prod.price}',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontFamily: 'Lato'),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
