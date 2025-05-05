import 'package:flutter/material.dart';

class CartBadge extends StatelessWidget {
  CartBadge({required this.value, required this.child});

  final Widget child;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrange),
            constraints: BoxConstraints(minHeight: 16, minWidth: 16),
            child: Text(
              value,
              style: TextStyle(fontSize: 10, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
