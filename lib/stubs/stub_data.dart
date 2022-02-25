// ignore_for_file: non_constant_identifier_names

import 'package:marketko_app/models/categorymodel.dart';
import 'package:marketko_app/models/productmodel.dart';

class Stubs {
  var CategoryList = [
    Category(
        id: 1,
        name: 'Electronics',
        image:
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
    Category(
        id: 2,
        name: 'Makeup',
        image:
            'https://images.unsplash.com/photo-1596462502278-27bfdc403348?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2080&q=80'),
    Category(
        id: 3,
        name: 'Accessories',
        image:
            'https://images.unsplash.com/photo-1542219550-76864b1bc385?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80'),
    Category(
        id: 4,
        name: 'Video Games',
        image:
            'https://images.unsplash.com/photo-1623934199716-dc28818a6ec7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80'),
    Category(
        id: 5,
        name: 'Books',
        image:
            'https://images.unsplash.com/photo-1615976909545-a2d402c7dac3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
  ];

  var CarouselList = [
    'https://images.unsplash.com/photo-1526178613552-2b45c6c302f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1607082349566-187342175e2f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1521404567986-a2c39cde0c31?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80 '
  ];

  var ProductList = [
    Product(
      id: '1',
      name: 'Wireless Headphone "Beats"',
      category: 'Electronics',
      description:
          'Wireless headphones,working with bluetooth in area of 10 meters away,long battery lasting for almost 8 hours continuously',
      price: 150.0,
      rate: 4.5,
      seller: 'IBeats',
      stock: 43,
      imageUrl:
          'https://images.unsplash.com/photo-1545127398-14699f92334b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1935&q=80',
    ),
    Product(
      id: '2',
      name: 'Honor Watch Magic 2 46mm, Charcoal Black',
      category: 'Electronics',
      description:
          'Watch Dial Diameter: 46mmWatch Dial Material: Metal (Stainless Steel)Shell Material: Metal + PlasticScreen Size: 1.39-inch AMOLED color screen',
      price:  83.58,
      rate: 4.5,
      seller: 'Amazon',
      stock: 43,
      imageUrl:
          'https://m.media-amazon.com/images/I/51GOp-TgUWL._AC_.jpg',
    ),
    Product(
      id: '3',
      name: 'Dell 15au-7500nx laptop',
      category: 'Electronics',
      description:
          'Dell laptop with 16 Giga ram, 1TB HDD Disk drive and 256 GB SSD, Nvidia GeForce RTX 2080 6GB DDR5 graphics card, LED 21 inch screen with 1920*1080 resolution',
      price: 735.50,
      rate: 4.5,
      seller: 'Gamer Lap',
      stock: 10,
      imageUrl:
          'https://images.unsplash.com/photo-1554246247-6993b606e8b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
    ),
    Product(
      id: '4',
      name: 'Sony AirPods',
      category: 'Electronics',
      description:
      'Spatial audio with dynamic head tracking places sound all around you,Adaptive EQ automatically tunes music to your ears,All-new contoured design,Up to 6 hours of listening time with one charge,Up to 30 hours total listening time with the MagSafe Charging Case',
      price: 100.0,
      rate: 4.5,
      seller: 'MobiOnline_egy',
      stock: 70,
      imageUrl:
      'https://images.unsplash.com/photo-1631176093617-63490a3d785a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80',
    ),
    Product(
      id: '5',
      name: 'Essence keep it perfect! make-up fix. spray',
      category: 'Makeup',
      description:
      'Essence Keep It Perfect Fixing Spray,Type: Makeup Finishing,EAN-13: 4250947564189',
      price: 168.75,
      rate: 4.5,
      seller: 'Amazon.eg',
      stock: 283,
      imageUrl:
      'https://m.media-amazon.com/images/I/61hkmmVTEOL._AC_SL1500_.jpg',
    )
  ];


}
