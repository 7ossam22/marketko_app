import 'package:flutter/material.dart';
import 'package:marketko_app/models/productmodel.dart';
import 'package:marketko_app/view_models/productdetails_viewmodel.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductDetailsViewModel _viewModel;
  late Product _args;

  @override
  void initState() {
    super.initState();
    _viewModel = ProductDetailsViewModel(context: context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _args = ModalRoute.of(context)!.settings.arguments as Product;
  }

  @override
  void dispose() {
    super.dispose();
  _viewModel.onScreenDisposed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.brown,
        ),
        elevation: 0,
        title: Text(
          _args.name,
          style: const TextStyle(color: Colors.brown),
        ),
        centerTitle: true,
      ),
      body: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: '${_args.name}_hero',
                          child: Image.network(
                            _args.imageUrl,
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        child: Text(
                          _args.name,
                          style: const TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _args.description,
                      style: const TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Rate ${_args.rate}',
                        style: const TextStyle(
                          color: Colors.brown,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 230,
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton.icon(
                            onPressed: () {
                              _viewModel.onCheckOutItemClicked();
                            },
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 22,
                            ),
                            label: const Text(
                              'Checkout',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Text(
                            '\$${_args.price}',
                            style: const TextStyle(
                              color: Colors.brown,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
    );
  }
}
