// import 'package:flutter/material.dart';
//
// class CustomAppBar extends StatelessWidget {
//   final Widget appBarTitleWidget;
//   final bool isCartIcon;
//
//   const CustomAppBar({Key? key, required this.appBarTitleWidget,required this.isCartIcon,})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       title: appBarTitleWidget,
//       centerTitle: true,
//       iconTheme: const IconThemeData(color: Colors.brown),
//       actions: (isCartIcon)?[IconButton(
//         icon: const Icon(
//           Icons.shopping_cart_outlined,
//           color: Colors.brown,
//           size: 30,
//         ),
//       ),]: null,
//     );
//   }
// }
