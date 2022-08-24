import 'dart:convert';

List<Product> productModelListFromJson(String val) => List<Product>.from(json
    .decode(val)['data']
    .map((product) => Product.productFromJson(product)));

class Product {
  final String id;
  final String name;
  final String subtitle;
  final String description;
  final String price;
  final List<String> image;

  Product({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        name: data['name'],
        subtitle: data['subtitle'],
        description: data['description'],
        price: data['price'],
        image: List<String>.from(
          data['imgs'].map(
            (img) => img['img'],
          ),
        ),
      );
}
