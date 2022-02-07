import 'package:flutter/material.dart';
import 'package:marketko_app/models/categorymodel.dart';

class CategoryTemplate extends StatelessWidget {
  final Category category;

  const CategoryTemplate({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: SizedBox(
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'products',arguments: category);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    category.image,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 170,
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
      ),
    );
  }
}
