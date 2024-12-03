class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String manufacturer;
  final String category;
  final String condition;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.manufacturer,
    required this.category,
    required this.condition,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      manufacturer: json['manufacturer'],
      category: json['category'],
      condition: json['condition'],
      imageUrl: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'manufacturer': manufacturer,
      'category': category,
      'condition': condition,
      'image': imageUrl,
    };
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, price: $price, quantity: $quantity, manufacturer: $manufacturer, category: $category, condition: $condition, imageUrl: $imageUrl}';
  }
}
