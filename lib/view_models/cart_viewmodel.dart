import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketko_app/api/api_implementation.dart';
import 'package:rxdart/rxdart.dart';

class CartViewModel {
  final ApiImplementation _api = ApiImplementation().Singleton();
  final BuildContext context;

  CartViewModel({required this.context});

  final BehaviorSubject<bool> _placeOrderState = BehaviorSubject.seeded(false);

  Stream<bool> get placeOrderState => _placeOrderState;

  onPlacingOrderRequest() async {
    _placeOrderState.add(await _api.submitPlaceOrder());
    Fluttertoast.showToast(msg: 'Thanks for purchasing');
  }
}
