part of models;

class Post {
  String? id;
  String? title;
  DateTime? publishedDate;
  bool? active;
  Product product = Product();
  String? want;
  String? wantDescription;
  List<Location>? locations;
  User? user;
  List<Counteroffer>? counteroffers;
  List<Post>? recommended;
  num? fairIndex;
  num? distance;

  Post({
    this.id,
    this.title,
    this.publishedDate,
    this.active,
    required this.product,
    this.want,
    this.wantDescription,
    this.locations,
    this.user,
    this.counteroffers,
    this.recommended,
    this.fairIndex,
    this.distance,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    title = json['title'] as String;
    publishedDate = dateTimeFromString(json['publishedDate'] as String);
    active = json['active'] as bool;
    want = json['want'] as String;
    wantDescription = json['wantDescription'] as String;
    product = json['object'] != null
        ? Product.fromJson(json['object'] as Map<String, dynamic>)
        : Product();
    if (json['locations'] != null) {
      locations = <Location>[];
      json['locations'].forEach((dynamic v) {
        locations!.add(Location.fromJson(v as Map<String, dynamic>));
      });
    }
    user = json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null;
    if (json['counteroffers'] != null) {
      counteroffers = <Counteroffer>[];
      json['counteroffers'].forEach((dynamic v) {
        counteroffers!.add(Counteroffer.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['recommended'] != null) {
      recommended = <Post>[];
      json['recommended'].forEach((dynamic v) {
        recommended!.add(Post.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['publishedDate'] = publishedDate;
    data['active'] = active;
    data['want'] = want;
    data['wantDescription'] = wantDescription;
    if (product != null) data['object'] = product.toJson();
    if (locations != null) {
      data['locations'] = locations!.map((dynamic v) => v.toJson()).toList();
    }
    if (user != null) data['user'] = user!.toJson();
    if (counteroffers != null) {
      data['counteroffers'] =
          counteroffers!.map((dynamic v) => v.toJson()).toList();
    }
    if (recommended != null) {
      data['recommended'] =
          recommended!.map((dynamic v) => v.toJson()).toList();
    }
    return data;
  }
}

Post demoPost = Post(
  id: '1',
  title: 'Control de PS4',
  publishedDate: dateTimeFromString('2021-05-01'),
  active: true,
  product: Product(
    id: '1',
    name: 'Control de PS4',
    description: 'Dualshock 4 en perfecto estado',
    category: 'Videojuegos',
    condition: 4,
    price: 150000,
    intrinsicValue: 130000,
    imageUrls: ["assets/images/image_popular_product_1.png"],
  ),
  locations: [
    Location(id: '1', name: 'Casa', latitude: 4.643469, longitude: -74.056975),
  ],
  user: User(),
  counteroffers: [
    Counteroffer(
      id: '1',
      message: 'Me gustaría intercambiar contigo, puedo ir a donde me digas',
      product: Product(
        id: '1',
        name: 'Tenis Nike Talla 39',
        description: 'Tennis en buena condición talla 39',
        category: 'Videojuegos',
        condition: 4,
        imageUrls: ["assets/images/counteroffer_1.png"],
      ),
      user: User(),
      fairIndex: -0.4,
      distance: 4,
    ),
    Counteroffer(
      id: '1',
      message: 'Realmente necesito un control, por favor intercambia conmigo',
      product: Product(
        id: '3',
        name: 'Camiseta Adidas nueva',
        description: 'Camiseta Adidas nueva',
        category: 'Deporte',
        condition: 5,
        imageUrls: ["assets/images/counteroffer_2.png"],
      ),
      user: User(),
      fairIndex: 0.3,
      distance: 0.04,
    ),
  ],
  recommended: [
    Post(
      id: '4',
      title: 'Headset',
      publishedDate: dateTimeFromString('2021-05-01'),
      active: true,
      product: Product(
        id: '1',
        name: 'Headset',
        description: 'Headset para gaming en muy buen estado',
        category: 'Videojuegos',
        imageUrls: ["assets/images/recommended_product.png"],
        condition: 4,
      ),
      distance: 3.0,
      user: User(),
      fairIndex: 0.1,
    ),
  ],
);
