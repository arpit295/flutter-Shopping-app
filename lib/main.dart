import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/orders.dart';
import 'package:shopping_app/product_overview_screen.dart';
import 'package:shopping_app/products.dart';
import 'cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Colors.purple,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 20))),
        title: 'MyShop',
        home: ProductOverviewScreen(),
      ),
    );
  }
}
