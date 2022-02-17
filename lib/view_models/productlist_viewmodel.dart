import 'package:flutter/material.dart';
import 'package:marketko_app/api/api_implementation.dart';
import 'package:marketko_app/models/categorymodel.dart';
import 'package:marketko_app/models/productmodel.dart';
import 'package:rxdart/rxdart.dart';

class ProductScreenViewModel {
  final BuildContext context;

  ProductScreenViewModel({required this.context});

  final ApiImplementation _api = ApiImplementation().Singleton();

  final BehaviorSubject<List> _productsList = BehaviorSubject.seeded([]);
  final BehaviorSubject<String> _catName = BehaviorSubject.seeded('');

  Stream<List> get productList => _productsList;
  Stream<String> get catName => _catName;

  onViewModelInit() async {
    final _args = ModalRoute.of(context)!.settings.arguments as Category;
    print('this Category is : ${_args.name}');
    _catName.add(_args.name);
  }

  onGettingProductList() async {
    _productsList.add(await _api.getProductsList());
  }

  onProductItemTapped(Product product) {
    Navigator.pushNamed(context, 'productDetails', arguments: product);
  }
}
