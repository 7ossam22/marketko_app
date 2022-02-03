import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketko_app/api/api_implementation.dart';
import 'package:marketko_app/api/api_interface.dart';
import 'package:rxdart/rxdart.dart';

class SignInViewModel {
  final ApiImplementation _api = ApiImplementation();

  // ignore: non_constant_identifier_names
  final BehaviorSubject<bool> _progress_listener =
      BehaviorSubject<bool>.seeded(false);

  // ignore: non_constant_identifier_names
  Stream<bool> get progress_listener => _progress_listener;

  Future<void> onSigninSuccessfully(
      String email, String password, BuildContext context) async {
    _progress_listener.add(true);
    ApiState _state = await _api.signInWithCredentials(email, password);
    if (_state.name == 'successful') {
      Navigator.popAndPushNamed(context, 'home');
    }
    Fluttertoast.showToast(
      msg: 'Sign in ${_state.name}',
      fontSize: 13,
      backgroundColor: Colors.grey[200],
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.grey[900],
    );
    _progress_listener.add(false);
  }
}
