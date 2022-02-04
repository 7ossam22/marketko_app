import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselWidget extends StatelessWidget {
  final List list;

  const CustomCarouselWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: list
          .map((image) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: 400,
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
