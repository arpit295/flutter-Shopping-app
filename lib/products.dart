import 'package:flutter/foundation.dart';
import 'package:shopping_app/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Red Shirt',
        imageUrl:
            'https://marinaracewear.com/storage/media/attributes/9/0/8/6/6/90866/conversions/2-category.jpg',
        description: 'A Red shirt - it is pretty red.',
        price: 1500),
    Product(
        id: 'p2',
        title: 'Trousers',
        imageUrl:
            'https://www.carriercompany.co.uk/cdn/shop/files/blackworktrouserswomens1-1.jpg?v=1714055559',
        description: 'A Nice pair of trousers.',
        price: 500),
    Product(
        id: 'p3',
        title: 'Yellow Scarf',
        imageUrl: 'https://m.media-amazon.com/images/I/61S-o2zbBgL.jpg',
        description: 'Warm and cozy - Exactly what you need for the winters. ',
        price: 500),
    Product(
        id: 'p4',
        title: 'A Pan',
        imageUrl: 'https://m.media-amazon.com/images/I/71JoN9G2IsL.jpg',
        description: 'Prepare Any meal you want.',
        price: 1000),
    Product(
        id: 'p5',
        title: 'Sports Shoes',
        imageUrl:
            'https://rukminim2.flixcart.com/image/850/1000/xif0q/kids-shoe/l/i/s/3-jump1705blk3-tracer-original-imagtyb5cnqvaqfs.jpeg?q=90&crop=false ',
        description: 'High-quality sports shoes for running and training.',
        price: 2500),
    Product(
        id: 'p6',
        title: 'Leather Wallet',
        imageUrl:
            'https://m.media-amazon.com/images/I/71ZEgcRYDqL._AC_UY580_.jpg',
        description: 'Premium leather wallet with multiple compartments.',
        price: 800),
    Product(
        id: 'p7',
        title: 'Wireless Headphones',
        imageUrl:
            'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MUW23_AV3?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1712255584536',
        description: 'Noise-canceling wireless headphones for great sound.',
        price: 3500),
    Product(
        id: 'p8',
        title: 'Analog Wrist Watch',
        imageUrl:
            'https://m.media-amazon.com/images/I/81np1m9MGwL._AC_UY780_.jpg',
        description: 'Elegant and stylish wristwatch for daily wear.',
        price: 2000),
    Product(
        id: 'p9',
        title: 'Backpack',
        imageUrl: 'https://m.media-amazon.com/images/I/81WjalMN8mL.jpg',
        description: 'Spacious and durable backpack for daily use.',
        price: 1800),
    Product(
        id: 'p10',
        title: 'Sunglasses',
        imageUrl:
            'https://www.tuttiandco.com/cdn/shop/files/Rest2.jpg?v=1711624896&width=1200',
        description: 'Stylish sunglasses with UV protection.',
        price: 1200),
    Product(
        id: 'p11',
        title: 'Bluetooth Speaker',
        imageUrl: 'https://m.media-amazon.com/images/I/718yxonHN8L.jpg',
        description: 'Portable Bluetooth speaker with deep bass.',
        price: 2200),
    Product(
        id: 'p12',
        title: 'Smart Watch',
        imageUrl:
            'https://i5.walmartimages.com/seo/Apple-Watch-Ultra-2-49-mm-titanium-smart-watch-Ocean-band-fluoroelastomer-orange-wrist-size-5-12-7-87-64-GB-Wi-Fi-LTE-UWB-Bluetooth-4G-2-17-oz_554813d6-72ed-4e7c-9582-0c3399f1bf02.69cc606406b601a85df32816cf1b5838.jpeg',
        description: 'Feature-packed smartwatch with health tracking.',
        price: 3000),
    Product(
        id: 'p13',
        title: 'Formal Blazer',
        imageUrl: 'https://img.fruugo.com/product/3/01/1636858013_max.jpg',
        description: 'Elegant formal blazer for office wear.',
        price: 4500),
    Product(
        id: 'p14',
        title: 'Coffee Maker',
        imageUrl:
            'https://www.salton.com/cdn/shop/files/FC2149_GB_inset_01.jpg?v=1721764733',
        description: 'Automatic coffee maker for quick brewing.',
        price: 2500),
    Product(
        id: 'p15',
        title: 'Wooden Dining Table',
        imageUrl: 'https://m.media-amazon.com/images/I/91HS26QlydL.jpg',
        description: 'Premium wooden dining table for 4 people.',
        price: 12000),
    Product(
        id: 'p16',
        title: 'Air Purifier',
        imageUrl:
            'https://assets.wfcdn.com/im/59428404/compr-r85/2680/268046992/Air+Purifiers+For+Home+Large+Room+Up+To+1076+Sq+Ft+With+PM+2.5+Display+Air+Quality+Sensor%2C+H13+True+HEPA+Filter+Remove+99.97%25+Of+Pet+Hair+With+Double-Sided+Air+Inlet%2C+24Db%2C+White.jpg',
        description: 'Removes dust, allergens, and pollutants from air.',
        price: 6000),
    Product(
        id: 'p17',
        title: 'Wireless Mouse',
        imageUrl: 'https://content.etilize.com/Original/1041315427.jpg',
        description: 'Smooth and responsive wireless mouse for work.',
        price: 800),
  ];

  // var _showFavoritesOnly = false;
  List<Product> get items => _items;
  // if (_showFavoritesOnly) {
  //   return _items.where((prodItem) => prodItem.isFavorite).toList();
  // }

  List<Product> get FavoritesItem {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }
  //
  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  // void addProduct() {
  //   // productItem.add(value);
  //   notifyListeners();
  // }
}
