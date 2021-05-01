part of models;

class User {
  String? id;
  String? nationalId;
  String? name;
  String? email;
  String? phone;
  String? profilePictureUrl;
  num? rating;
  List<Location>? preferredLocations;
  List<Post>? posts;
  List<Counteroffer>? counteroffers;

  User({
    this.id,
    this.nationalId,
    this.name,
    this.email,
    this.phone,
    this.profilePictureUrl,
    this.rating,
    this.preferredLocations,
    this.posts,
    this.counteroffers,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    nationalId = json['nationalId'] as String;
    name = json['name'] as String;
    email = json['email'] as String;
    phone = json['phone'] as String;
    profilePictureUrl = json['profilePictureUrl'] as String;
    rating = json['rating'] as num;
    if (json['preferredLocations'] != null) {
      preferredLocations = <Location>[];
      json['preferredLocations'].forEach((dynamic v) {
        Location.fromJson(v as Map<String, dynamic>);
      });
    }
    if (json['posts'] != null) {
      posts = <Post>[];
      json['posts'].forEach((dynamic v) {
        Post.fromJson(v as Map<String, dynamic>);
      });
    }
    if (json['counteroffers'] != null) {
      counteroffers = <Counteroffer>[];
      json['counteroffers'].forEach((dynamic v) {
        Counteroffer.fromJson(v as Map<String, dynamic>);
      });
    }
  }

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nationalId'] = nationalId;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['profilePictureUrl'] = profilePictureUrl;
    data['rating'] = rating;
    if (preferredLocations != null) {
      data['preferredLocations'] =
          preferredLocations!.map((v) => v.toJson()).toList();
    }
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    if (counteroffers != null) {
      data['counteroffers'] = counteroffers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
