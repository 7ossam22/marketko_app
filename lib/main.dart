import 'package:flutter/material.dart';
import 'package:marketko_app/ui/home_screen.dart';
import 'package:marketko_app/ui/product_screen.dart';
import 'ui/signin_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Marketko',
      routes: {
        '/': (context) => const SignIn_Screen(),
        'home': (context) => const HomeScreen(),
        'products': (context) => const ProductScreen(),
      },
    ),
  );
}
// MaterialApp(
//   debugShowCheckedModeBanner: false,
//   initialRoute: '/',
//   title: 'Marketko',
//   routes: {
//     '/': (context) => const SignIn_Screen(),
//     'home': (context) => const HomeScreen(),
//     'products': (context) => const ProductScreen(),
//   },
// ),

// ProductItem(product: Product(
// id: '1',
// name: 'Wireless Headphone "Beats"',
// category: 'Electronics',
// description:
// 'Wireless headphones,working with bluetooth in area of 10 meters away,long battery lasting for almost 8 hours continuously',
// price: 150.0,
// rate: 4.5,
// seller: 'IBeats',
// stock: 43,
// imageUrl:
// 'https://images.unsplash.com/photo-1545127398-14699f92334b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1935&q=80',
// ),)
// );
