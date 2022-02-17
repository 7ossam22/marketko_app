import 'package:flutter/material.dart';
import 'package:marketko_app/models/categorymodel.dart';

class CategoryTemplate extends StatelessWidget {
  final Category category;

  //This function handle onCategoryTap;
  final void Function() onTap;

  const CategoryTemplate(
      {Key? key, required this.category, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            direction: Axis.vertical,
            children: [
              Expanded(
                child: Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      category.image,
                      fit: BoxFit.cover,
                    ),
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
