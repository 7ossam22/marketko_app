import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injector/injector.dart';
import 'package:marketko_app/api/api_interface.dart';
import 'package:marketko_app/models/productmodel.dart';
import 'package:rxdart/rxdart.dart';

class ProductScreenViewModel {
  final BuildContext context;

  ProductScreenViewModel({required this.context});

  final IApi _api = Injector.appInstance.get<IApi>();

  final BehaviorSubject<List?> _productsList = BehaviorSubject.seeded(null);

  Stream<List?> get productList => _productsList;

  onGettingProductList(String query) async {
    //ToDo -> Handel query functionality
    _productsList.add(null);
    _productsList.add(await _api.getProductsList(query));
  }

  onProductItemTapped(Product product) {
    Navigator.pushNamed(context, 'productDetails', arguments: product);
  }

  onSortProductsClick() {
    //ToDo -> Implement sorting function
    Fluttertoast.showToast(msg: 'Sort clicked');
  }

  onCartClicked() {
    //ToDo -> Implement Navigation to Cart screen
    Navigator.pushNamed(context, 'cart');
  }

  void onScreenDisposed() {
    _productsList.add(null);
  }
}
