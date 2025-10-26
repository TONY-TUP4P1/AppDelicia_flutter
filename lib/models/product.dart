class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image; // ruta relativa a assets/images/

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  // útil si quieres luego parsear JSON
  factory Product.fromMap(Map<String, dynamic> m) => Product(
        id: m['id'] as String,
        name: m['name'] as String,
        description: m['description'] as String,
        price: (m['price'] as num).toDouble(),
        image: m['image'] as String,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'image': image,
      };
}
