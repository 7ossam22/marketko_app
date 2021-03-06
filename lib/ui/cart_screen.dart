// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:marketko_app/models/productmodel.dart';
import 'package:marketko_app/view_models/cart_viewmodel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartViewModel _viewModel;
  double _subTotal = 0;
  double _delivery = 0;
  late Product _args;
  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _viewModel = CartViewModel(context: context);

    _viewModel.productPrice.listen((event) {
      setState(() {
        _subTotal = event;
      });
    });
    _viewModel.deliveryPrice.listen((event) {
      setState(() {
        _delivery = event;
      });
    });
    _viewModel.totalPrice.listen((event) {
      setState(() {
        _totalPrice = event;
      });
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _args = ModalRoute.of(context)!.settings.arguments as Product;
    _viewModel.onViewModelInit(_args);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.brown),
      ),
      body: Flex(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.vertical,
        children: [
          Flexible(flex: 4, child: Container()),
          Flexible(
            flex: 3,
            child: Material(
              elevation: 15,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    topEnd: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Flex(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    direction: Axis.vertical,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 10,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Items summary',
                        style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                              color: Colors.brown[700],
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '\$${_subTotal.toString()}',
                            style: TextStyle(
                              color: Colors.brown[700],
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.brown,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery',
                            style: TextStyle(
                              color: Colors.brown[700],
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '\$${_delivery.toString()}',
                            style: TextStyle(
                              color: Colors.brown[700],
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.brown,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${_totalPrice.toString()}',
                            style: const TextStyle(
                              color: Colors.brown,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextButton(
                            onPressed: () => _viewModel.onPlacingOrderRequest(),
                            child: const Text(
                              'Place order',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
