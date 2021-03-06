import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  final List list;

  const CustomCarousel({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: list
          .map((image) =>
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: 400,
                ),
              ),
            ),
          ))
          .toList(),
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        height: 180,
      ),
    );
  }
}
