//product model class
class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  late bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.isFavorite = false,
  });


}