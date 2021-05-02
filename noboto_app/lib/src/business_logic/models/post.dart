part of models;

class Post {
  String? id;
  String? title;
  DateTime? publishedDate;
  bool? active;
  Product? product;
  List<Location>? locations;
  User? user;
  List<Counteroffer>? counteroffers;

  Post({
    this.id,
    this.title,
    this.publishedDate,
    this.active,
    this.product,
    this.locations,
    this.user,
    this.counteroffers,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    title = json['title'] as String;
    publishedDate = dateTimeFromString(json['publishedDate'] as String);
    active = json['active'] as bool;
    product = json['object'] != null
        ? Product.fromJson(json['object'] as Map<String, dynamic>)
        : null;
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
  }

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['publishedDate'] = publishedDate;
    data['active'] = active;
    if (product != null) data['object'] = product!.toJson();
    if (locations != null) {
      data['locations'] = locations!.map((dynamic v) => v.toJson()).toList();
    }
    if (user != null) data['user'] = user!.toJson();
    if (counteroffers != null) {
      data['counteroffers'] =
          counteroffers!.map((dynamic v) => v.toJson()).toList();
    }
    return data;
  }
}
