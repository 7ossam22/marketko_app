import 'package:flutter/material.dart';
import 'package:marketko_app/DI.dart';
import 'package:marketko_app/ui/cart_screen.dart';
import 'package:marketko_app/ui/home_screen.dart';
import 'package:marketko_app/ui/productdetails_screen.dart';
import 'package:marketko_app/ui/products_screen.dart';

import 'ui/signin_screen.dart';

void main() {
  runApp(const MyApp());
  setDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Marketko',
      routes: {
        '/': (context) => const SignInScreen(),
        'home': (context) => const HomeScreen(),
        'products': (context) => const ProductScreen(),
        'productDetails': (context) => const ProductDetailsScreen(),
        'cart': (context) => const CartScreen(),
      },
    );
  }
}
