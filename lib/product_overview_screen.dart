import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart.dart';
import 'package:shopping_app/cart_screen.dart';
import 'package:shopping_app/orders_detail.dart';
import 'package:shopping_app/product_item.dart';
import 'package:shopping_app/products.dart';
import 'badge.dart';

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        _showOnlyFavorites ? productsData.FavoritesItem : productsData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyShop',
          style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w500),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (int selectedValue) {
              setState(() {
                if (selectedValue == 0) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                value: 0,
                child: Text(
                  'Only Favorites',
                  style: TextStyle(
                      fontFamily: 'Lato', fontWeight: FontWeight.w600),
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Text(
                  'Show All',
                  style: TextStyle(
                      fontFamily: 'Lato', fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          Consumer<Cart>(
            builder: (context, cart, child) => CartBadge(
              value: cart.itemCount.toString(),
              color: Colors.deepOrange,
              child: child ?? SizedBox(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: GridView.builder(
        itemCount: products.length,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: products[index],
            child: ProductItem(
                // id: productsData.items[index].id,
                // imageUrl: productsData.items[index].imageUrl,
                // title: productsData.items[index].title));
                ),
          );
        },
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
