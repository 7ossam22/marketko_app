import 'package:flutter/material.dart';
import 'package:marketko_app/view_models/signin_viewmodel.dart';

// ignore: camel_case_types
class _welcome_widgetGroup extends StatelessWidget {
  const _welcome_widgetGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(alignment: Alignment.centerLeft, children: [
        Image.network(
            'https://images.unsplash.com/photo-1499233983070-99a5f004e720?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Text(
                'Welcome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Sign in to continue',
                style: TextStyle(fontSize: 30, color: Colors.white),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

// ignore: camel_case_types
class _Signin_handlerGroup extends StatefulWidget {
  const _Signin_handlerGroup({Key? key}) : super(key: key);

  @override
  _Signin_handlerGroupState createState() => _Signin_handlerGroupState();
}

// ignore: camel_case_types
class _Signin_handlerGroupState extends State<_Signin_handlerGroup> {
  SignInViewModel _viewModel = SignInViewModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Email',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.brown,
              ),
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Password',
            style: TextStyle(
                color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
              color: Colors.brown,
            ))),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: StreamBuilder<bool>(
                stream: _viewModel.progress_listener,
                builder: (context, snapshot) {
                  return snapshot.data != true
                      ? TextButton(
                          onPressed: () {
                            _viewModel.onSigninSuccessfully(
                                'email', 'password', this.context);
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ))
                      : const Center(
                        child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                      );
                }),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _SigninError_handlerGroup extends StatefulWidget {
  const _SigninError_handlerGroup({Key? key}) : super(key: key);

  @override
  __SigninError_handlerGroupState createState() =>
      __SigninError_handlerGroupState();
}

// ignore: camel_case_types
class __SigninError_handlerGroupState extends State<_SigninError_handlerGroup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Sign up',
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot password?',
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//The main widget is here -->

// ignore: camel_case_types
class SignIn_Screen extends StatefulWidget {
  const SignIn_Screen({Key? key}) : super(key: key);

  @override
  _SignIn_ScreenState createState() => _SignIn_ScreenState();
}

// ignore: camel_case_types
class _SignIn_ScreenState extends State<SignIn_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            _welcome_widgetGroup(),
            _Signin_handlerGroup(),
            _SigninError_handlerGroup(),
          ],
        ),
      ),
    );
  }
}
