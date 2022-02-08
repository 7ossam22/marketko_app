import 'package:flutter/material.dart';
import 'package:marketko_app/models/productmodel.dart';
import 'package:marketko_app/view_models/productdetails_viewmodel.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _args = ModalRoute.of(context)!.settings.arguments as Product;
    ProductDetailsViewModel _viewModel =
        ProductDetailsViewModel(product: _args);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.brown,
        ),
        elevation: 0,
        title: Text(
          _viewModel.product.name,
          style: const TextStyle(
            color: Colors.brown,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
