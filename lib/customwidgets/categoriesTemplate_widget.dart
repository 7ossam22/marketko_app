import 'package:flutter/material.dart';
import 'package:marketko_app/models/categorymodel.dart';

class CategoryTemplate extends StatelessWidget {
  final Category category;

  const CategoryTemplate({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'products',arguments: category);
          },
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            direction: Axis.vertical,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    category.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  category.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
