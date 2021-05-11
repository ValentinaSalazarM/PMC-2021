part of models;

class Exchange {
  String? id;
  bool? active;
  DateTime? exchangeDate;
  String? step;
  Location? location;
  Post? offer;
  Counteroffer? counteroffer;

  Exchange({
    this.id,
    this.active,
    this.exchangeDate,
    this.step,
    this.location,
    this.offer,
    this.counteroffer,
  });

  Exchange.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    active = json['active'] as bool;
    exchangeDate = dateTimeFromString(json['exchangeDate'] as String);
    step = json['step'] as String;
    location = json['location'] != null
        ? Location.fromJson(json['location'] as Map<String, dynamic>)
        : null;
    offer = json['offer'] != null
        ? Post.fromJson(json['offer'] as Map<String, dynamic>)
        : null;
    counteroffer = json['counteroffer'] != null
        ? Counteroffer.fromJson(json['counteroffer'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['active'] = active;
    data['exchangeDate'] = exchangeDate;
    data['step'] = step;
    if (location != null) data['location'] = location!.toJson();
    if (offer != null) data['offer'] = offer!.toJson();
    if (counteroffer != null) data['counteroffer'] = counteroffer!.toJson();

    return data;
  }

  int getStateNumber() {
    switch (this.step) {
      case "ACEPTADA":
        return 1;
      case "ESPERA_CONFIRMACION":
        return 2;
      case "EN_PROGRESO":
        return 3;
      case "FINALIZADO":
        return 4;
      default:
        return 0;
    }
  }
}
