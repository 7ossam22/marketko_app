import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketko_app/customwidgets/templates/productstemplate_widget.dart';
import 'package:marketko_app/view_models/products_viewmodel.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductScreenViewModel _viewModel;
  late String _args;

  String query = '';

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    _viewModel = ProductScreenViewModel(context: context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _args = ModalRoute.of(context)!.settings.arguments as Category;
    _args = ModalRoute.of(context)!.settings.arguments as String;
    _viewModel.onGettingProductList(_args);
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
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.brown),
        title: SizedBox(
          height: 40,
          child: TextField(
            onSubmitted : (val) => setState(() {
              // ToDo -> Handel searching query
              _args.isNotEmpty ? query = _args : query = val;
              _viewModel.onGettingProductList(query);
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
            onPressed: () => _viewModel.onCartClicked(),
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
                      onPressed: () => _viewModel.onSortProductsClick(),
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
          StreamBuilder<List?>(
              stream: _viewModel.productList,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                      child: SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      color: Colors.brown,
                    ),
                  ));
                } else if ((snapshot.data ?? []).isEmpty) {
                  return Column(
                    children: const [
                      Icon(
                        Icons.error_outline_sharp,
                        color: Colors.brown,
                        size: 40,
                      ),
                      Text(
                        'No products matching',
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Expanded(
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      padding: const EdgeInsets.all(20),
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.8,
                      children: snapshot.data!
                          .map((product) => ProductTemplate(
                              product: product,
                              onTap: () =>
                                  _viewModel.onProductItemTapped(product)))
                          .toList(),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
