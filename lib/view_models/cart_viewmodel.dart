import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injector/injector.dart';
import 'package:marketko_app/api/api_interface.dart';
import 'package:rxdart/rxdart.dart';

class CartViewModel {
  final IApi _api = Injector.appInstance.get<IApi>();
  final BuildContext context;

  CartViewModel({required this.context});

  final BehaviorSubject<bool> _placeOrderState = BehaviorSubject.seeded(false);

  Stream<bool> get placeOrderState => _placeOrderState;

  onPlacingOrderRequest() async {
    _placeOrderState.add(await _api.submitPlaceOrder());
    Fluttertoast.showToast(msg: 'Thanks for purchasing');
  }
}
