import 'package:new_project/models/Product.dart';

class Data {
  final int id;

  final String name;

  final List<Product> products;

  Data({required this.id, required this.name, required this.products});

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map["id"],
      name: map["name"],
      products: (map["products"] as List<dynamic>).map((item) => Product.fromMap(item)).toList()
    );
  }
}
