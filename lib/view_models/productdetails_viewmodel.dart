import 'package:flutter/material.dart';
import 'package:marketko_app/models/productmodel.dart';

class ProductDetailsViewModel {
  final BuildContext context;

  ProductDetailsViewModel({required this.context});

  void onCheckOutItemClicked(Product product) {
    //ToDo -> implement checkout method here,also navigation to cart screen
    Navigator.pushNamed(context, 'cart', arguments: product);
  }

  void onScreenDisposed() {
    //ToDo -> Implement Screen dispose handler
    throw UnimplementedError();
  }
}
