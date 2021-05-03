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
