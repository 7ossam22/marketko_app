import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketko_app/customwidgets/productItem_widget.dart';
import 'package:marketko_app/models/categorymodel.dart';
import 'package:marketko_app/view_models/productlist_viewmodel.dart';

final ProductScreenViewModel _viewModel = ProductScreenViewModel();

// Searchbar query value
String query = '';

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
        title: SizedBox(
          height: 40,
          child: TextField(
            onChanged: (val) => setState(() {
              val.isEmpty ? query = _args.name : query = val;
            }),
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              suffixIcon: Icon(Icons.search),
              hintText: 'Search.......',
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.brown,
                ),
              ),
            ),
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
            onPressed: () {
              //ToDo --> implement navigation to cart screen,
            },
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
                      onPressed: () {
                        //ToDo --> implement Sorting menu,
                      },
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
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      padding: const EdgeInsets.all(20),
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.8,
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
