import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injector/injector.dart';
import 'package:marketko_app/api/api_interface.dart';
import 'package:marketko_app/models/productmodel.dart';
import 'package:rxdart/rxdart.dart';

class CartViewModel {
  late Product _product;
  final IApi _api = Injector.appInstance.get<IApi>();
  final BuildContext context;

  CartViewModel({required this.context});

  final BehaviorSubject<bool> _placeOrderState = BehaviorSubject.seeded(false);
  final BehaviorSubject<double> _productPrice = BehaviorSubject.seeded(0);
  final BehaviorSubject<double> _deliveryPrice = BehaviorSubject.seeded(0);
  final BehaviorSubject<double> _totalPrice = BehaviorSubject.seeded(0);

  Stream<bool> get placeOrderState => _placeOrderState;

  Stream<double> get productPrice => _productPrice;

  Stream<double> get deliveryPrice => _deliveryPrice;

  Stream<double> get totalPrice => _totalPrice;

  onViewModelInit(Product product) {
    _product = product;
    _productPrice.add(product.price);
    _deliveryPrice.add(3.80);
    _totalPrice.add(_productPrice.value + _deliveryPrice.value);
  }

  onPlacingOrderRequest() async {
    _placeOrderState.add(await _api.submitPlaceOrder());
    Fluttertoast.showToast(msg: 'Thanks for purchasing');
  }
}
