part of models;

class Counteroffer {
  String? id;
  String? message;
  Product? product;
  User? user;
  Post? post;

  Counteroffer({
    this.id,
    this.message,
    this.product,
    this.user,
    this.post,
  });

  Counteroffer.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    message = json['message'] as String;
    product = json['object'] != null
        ? Product.fromJson(json['object'] as Map<String, dynamic>)
        : null;
    user = json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null;
    post = json['post'] != null
        ? Post.fromJson(json['post'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    if (product != null) data['object'] = product!.toJson();
    if (user != null) data['user'] = user!.toJson();
    if (post != null) data['post'] = post!.toJson();
    return data;
  }
}
