import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketko_app/models/productmodel.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 300,
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.brown, fontSize: 18, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
//
// LimitedBox(
// maxHeight: 300,
// child: Card(
// child: Column(
// children: [
// ClipRRect(
// child: Image.network(
// product.imageUrl,
// fit: BoxFit.cover,
// ),
// ),
// Text(
// product.name,
// maxLines: 2,
// style: const TextStyle(
// color: Colors.brown, fontSize: 18, fontWeight: FontWeight.bold),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// '\$ ${product.price}',
// style: const TextStyle(
// color: Colors.brown,
// fontSize: 18,
// ),
// ),
// IconButton(
// onPressed: () {
// Fluttertoast.showToast(
// msg: '${product.name} is in your favorite list',
// toastLength: Toast.LENGTH_SHORT);
// },
// icon: const Icon(
// Icons.favorite_border,
// color: Colors.brown,
// ))
// ],
// )
// ],
// ),
// ),
// );
