import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marketko_app/customwidgets/category_widget.dart';
import 'package:marketko_app/view_models/home_viewmodel.dart';

HomeViewModel _viewModel = HomeViewModel();

class _CustomCarouselWidget extends StatefulWidget {
  const _CustomCarouselWidget({Key? key}) : super(key: key);

  @override
  _CustomCarouselWidgetState createState() => _CustomCarouselWidgetState();
}

class _CustomCarouselWidgetState extends State<_CustomCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        height: 180,
        enlargeCenterPage: true,
      ),
      items: _viewModel.CarouselList.map(
        (image) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            width: 400,
          ),
        ),
      ).toList(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const SizedBox(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search.......',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.brown,),
              ),
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.brown,
              size: 30,
            )),
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.brown,
                ),
                iconSize: 30,
                onPressed: () {},
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _CustomCarouselWidget(),
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
            SizedBox(
              height: 550,
              child: GridView.count(
                crossAxisCount: 2,
                children: _viewModel.CategoryList.map(
                        (category) => CategoryTemplate(category, category.name))
                    .toList(),
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
