import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketko_app/models/productmodel.dart';
import 'package:rxdart/rxdart.dart';

class ProductDetailsViewModel {
  final BuildContext context;

  ProductDetailsViewModel({required this.context});

  final BehaviorSubject<Product> _productDetails = BehaviorSubject.seeded(
      Product(
          id: '',
          category: '',
          rate: 0,
          stock: 0,
          seller: '',
          description: '',
          name: '',
          imageUrl: '',
          price: 0));

  Stream<Product> get productDetails => _productDetails;

  onViewModelInit(Product _args) {
    _productDetails.add(_args);
  }

  void onCheckOutItemClicked() {
    //ToDo -> implement checkout method here,also navigation to cart screen
    Fluttertoast.showToast(msg: 'Navigate to cart screen');
  }

}

