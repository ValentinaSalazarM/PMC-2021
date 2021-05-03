part of models;

class User {
  String? nationalId;
  String? name;
  String? email;
  String? phone;
  String? profilePictureUrl;
  num? rating;
  List<Location>? preferredLocations = <Location>[];
  List<Post>? posts = <Post>[];
  List<Counteroffer>? counteroffers = <Counteroffer>[];

  User({
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

User userDemo = User(
  nationalId: '12345678',
  name: 'Sara',
  email: 'Lopez',
  phone: '3120983476',
  profilePictureUrl: 'assets/images/example_user_profile_pic.jpg',
  rating: 3.5,
  preferredLocations: <Location>[],
  posts: <Post>[demoPost, Post(product: demoProducts[1])],
  counteroffers: [
    Counteroffer(product: demoProducts[2]),
  ],
);
