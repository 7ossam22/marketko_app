import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SignInViewModel {
  // ignore: non_constant_identifier_names
  final BehaviorSubject<bool> _progress_listener =
      BehaviorSubject<bool>.seeded(false);
  // ignore: non_constant_identifier_names
  Stream<bool> get progress_listener  => _progress_listener;

  Future<void> onSigninSuccessfully(String email, String password,BuildContext context) async {
  _progress_listener.add(true);
  await Future.delayed(const Duration(seconds: 5));
  Navigator.popAndPushNamed(context, 'home');
  _progress_listener.add(false);
  }
}
