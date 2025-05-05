import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/products.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;
  ProductDetailScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: false);
    final selectedItem =
        productData.items.firstWhere((prod) => prod.id == productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedItem.title,
          style: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Lato'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: selectedItem.id,
              child: Image(
                image: NetworkImage(selectedItem.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '₹ ${selectedItem.price}',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lato'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              selectedItem.description,
              style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
