import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketko_app/customwidgets/productItem_widget.dart';
import 'package:marketko_app/models/categorymodel.dart';
import 'package:marketko_app/view_models/productlist_viewmodel.dart';

final ProductScreenViewModel _viewModel = ProductScreenViewModel();

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    _viewModel.onGettingProductList();
  }

  @override
  Widget build(BuildContext context) {
    final _args = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.brown),
        title: Text(
          _args.name,
          style: const TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: Colors.brown,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Products',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.brown),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.sort,
                        color: Colors.brown,
                      ),
                      label: const Text(
                        'Sort',
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<List>(
            stream: _viewModel.productList,
            builder: (context, snapshot) => (snapshot.data ?? []).isEmpty
                ? const Center(
                    child: SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      color: Colors.brown,
                    ),
                  ))
                : Expanded(
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisSpacing: 10,
                    padding: const EdgeInsets.fromLTRB(20, 2, 20, 0),
                    crossAxisCount: 2,
                    childAspectRatio: 1/2,
                    children: snapshot.data!
                        .map((product) => ProductItem(product: product))
                        .toList(),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
