import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/product.dart';
import 'package:shopping_app/product_detail_screen.dart';
import 'cart.dart';

class ProductItem extends StatelessWidget {
//   final String id;
//   final String imageUrl;
//   final String title;
//
//   ProductItem({required this.id, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, product, child) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.deepOrangeAccent,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.deepOrangeAccent,
            ),
            onPressed: () {
              cart.addItem(product.id, product.price.toString(), product.title);
            },
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            style: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Lato'),
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                          title: product.title,
                          productId: product.id,
                        )));
          },
          child: Image(
            image: NetworkImage(product.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
