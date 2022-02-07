class Product {
  late String id;
  late String name;
  late String description;
  late String category;
  late double price;
  late int stock;
  late String seller;
  late double rate;
  late String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.rate,
    required this.seller,
    required this.stock,
    required this.imageUrl,
  });
}
