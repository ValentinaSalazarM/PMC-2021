part of models;

class Product {
  String? id;
  String? name;
  String? description;
  String? category;
  num? condition;
  num? price;
  num? intrinsicValue;
  // Debería objeto tener la imagen? Yo opino que sí
  List<String>? imageUrls;

  Product(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.condition,
      this.price,
      this.intrinsicValue,
      this.imageUrls});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    description = json['description'] as String;
    category = json['category'] as String;
    condition = json['condition'] as num;
    price = json['price'] as num;
    intrinsicValue = json['intrinsicValue'] as num;
    if (json['imageUrls'] != null) {
      imageUrls = <String>[];
      json['imageUrls'].forEach((dynamic v) {
        imageUrls!.add(v as String);
      });
    }
  }

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['category'] = category;
    data['condition'] = condition;
    data['price'] = price;
    data['intrinsicValue'] = intrinsicValue;
    data['imageUrls'] = imageUrls;
    return data;
  }
}

// DEMO PRODUCTS
List<Product> demoProducts = [
  Product(
    id: '1',
    name: 'Control de PS4',
    description: 'Dualshock 4 en perfecto estado',
    category: 'Videojuegos',
    condition: 4,
    price: 150000,
    intrinsicValue: 130000,
    imageUrls: ["assets/images/image_popular_product_1.png"],
  ),
  Product(
    id: '2',
    name: 'Bermuda Nike Blanca',
    description: 'Talla M - una sola postura. Es de tela deportiva',
    category: 'Ropa',
    condition: 5,
    price: 80000,
    intrinsicValue: 75000,
    imageUrls: ["assets/images/image_popular_product_2.png"],
  ),
  Product(
    id: '3',
    name: 'Casco de bicicleta',
    description: 'Casco rojo, en buen estado, talla L',
    category: 'Deporte',
    condition: 3,
    price: 120000,
    intrinsicValue: 80000,
    imageUrls: ["assets/images/image_popular_product_3.png"],
  )
];
