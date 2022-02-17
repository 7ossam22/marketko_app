import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketko_app/models/productmodel.dart';

class ProductTemplate extends StatelessWidget {

  final Product product;

  //this function handle onItemTap;
  final void Function() onTap;

  const ProductTemplate({Key? key, required this.product, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${product.price}',
                style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 18,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: '${product.name} is in your favorite list',
                        toastLength: Toast.LENGTH_SHORT);
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.brown,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
