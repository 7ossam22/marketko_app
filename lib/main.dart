import 'package:flutter/material.dart';
import 'package:marketko_app/ui/home_screen.dart';

import 'ui/signin.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const SignIn_Screen(),
      'home': (context) => const HomeScreen(),
    },
  ));
}
