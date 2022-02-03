import 'package:flutter/material.dart';
import 'package:marketko_app/models/categorymodel.dart';

// ignore: non_constant_identifier_names
Widget CategoryTemplate(Category category, String onClick) => Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: SizedBox(
        child: Center(
          child: InkWell(
            onTap: () {
              print('category : ${onClick}');
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
