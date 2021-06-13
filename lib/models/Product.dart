class Product {
  final int id;

  final String name;

  final String image;

  final int price;

  Product({required this.id, required this.name, required this.image, required this.price});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map["id"],
      name: map["name"],
      image: map["image"],
      price: map["price"],
    );
  }

  static fromJson(item) {}
}
