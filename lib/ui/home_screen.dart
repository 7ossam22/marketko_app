import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketko_app/customwidgets/carouseltemplate_widget.dart';
import 'package:marketko_app/customwidgets/categoriesTemplate_widget.dart';
import 'package:marketko_app/view_models/home_viewmodel.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
     _viewModel = HomeViewModel(context: context);
    _viewModel.onGettingCategoryList();
    _viewModel.onGettingCarouselList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
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
        leading: IconButton(
            onPressed: () => _viewModel.onMenuClicked(),
            icon: const Icon(
              Icons.menu,
              color: Colors.brown,
              size: 30,
            )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.brown,
              size: 30,
            ),
            onPressed: () => _viewModel.onCartClicked(),
          ),
        ],
      ),
      body: Flex(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.vertical,
        children: [
          StreamBuilder<List>(
              stream: _viewModel.carouselList,
              builder: (context, snapshot) => (snapshot.data ?? []).isEmpty
                  ? const SizedBox(
                      height: 180,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : CustomCarouselWidget(list: snapshot.data!)),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
            child: Text(
              'Categories',
              style: TextStyle(
                color: Colors.brown,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(160, 0, 160, 0),
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List>(
                stream: _viewModel.catList,
                builder: (context, snapshot) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: (snapshot.data ?? []).isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.count(
                      childAspectRatio: 1/1.2,
                            padding:const EdgeInsets.all(20.0),
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                            children: snapshot.data!
                                .map((category) => CategoryTemplate(
                                      category: category,onTap:() => _viewModel.onCategoryItemTap(category),
                                    ))
                                .toList(),
                          ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
