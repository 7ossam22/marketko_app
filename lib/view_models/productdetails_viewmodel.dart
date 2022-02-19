import 'package:flutter/material.dart';

class ProductDetailsViewModel {
  final BuildContext context;

  ProductDetailsViewModel({required this.context});

  void onCheckOutItemClicked() {
    //ToDo -> implement checkout method here,also navigation to cart screen
    Navigator.pushNamed(context, 'cart');
  }

  void onScreenDisposed() {
    //ToDo -> Implement Screen dispose handler
  }
}
