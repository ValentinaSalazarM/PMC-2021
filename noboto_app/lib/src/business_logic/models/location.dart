part of models;

class Location {
  String? id;
  String? name;
  num? latitude;
  num? longitude;
  String? address;

  Location({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.address,
  });

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    latitude = json['latitude'] as num;
    longitude = json['longitude'] as num;
    address = json['address'] as String;
  }

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    return data;
  }
}
